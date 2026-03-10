// ══════════════════════════════════════════════════════════════════════════════
// styles/components.typ — компоненты книги рецептов
// ══════════════════════════════════════════════════════════════════════════════

#import "colors.typ": themes, default-theme

// ── Глобальные нейтральные цвета (не зависят от темы) ──────────────────────
#let card-bg   = rgb("#FAFAF8")
#let divider   = rgb("#E0DDD8")
#let muted     = rgb("#888888")
#let body-text = rgb("#2C2C2C")

// ── Переэкспорт для удобства (book.typ может импортировать отсюда) ──────────
#let accent = default-theme.accent


// ══════════════════════════════════════════════════════════════════════════════
// Вспомогательные блоки
// ══════════════════════════════════════════════════════════════════════════════

// Мета-чип (порции / время)
// width: 100% + align(center) обеспечивают одинаковую ширину и выравнивание
#let _meta-chip(label: "", value: "", theme: default-theme) = block(
  fill: theme.light,
  inset: (x: 8pt, y: 8pt),
  radius: 5pt,
  width: 100%,
)[
  #align(center)[
    #text(size: 7pt, weight: "bold", fill: theme.accent, tracking: 0.5pt)[#upper(label)]
    #linebreak()
    #v(1pt)
    #text(size: 10pt, fill: body-text)[#value]
  ]
]

// Ингредиент: строка или словарь (amount, name)
#let _render-ingredient(ing) = {
  if type(ing) == dictionary {
    [*#ing.amount* — #ing.name]
  } else {
    [#ing]
  }
}


// ══════════════════════════════════════════════════════════════════════════════
// recipe — главный макрос
// ══════════════════════════════════════════════════════════════════════════════
//
// Как устроены heading'и:
//   heading(level: 2)[#title]          ← plain text, только для outline/TOC
//   show heading.where(level: 2): _ => []  ← в book.typ, делает невидимым
//   text(size: 22pt, ...)[#title]      ← отдельный визуальный заголовок
//
// Такой подход гарантирует, что в TOC отображается чистое название рецепта
// без случайного переноса стилей (жирный шрифт, крупный размер и т.д.).
//
#let recipe(
  title: "",
  description: [],
  servings: "",
  prep-time: "",
  cook-time: "",
  ingredients: (),
  instructions: (),
  notes: none,
  theme: default-theme,
) = {
  pagebreak(weak: true)
  // Heading с plain-text телом — только для outline/TOC и гиперссылок.
  // show heading.where(level: 2): _ => []  в book.typ рендерит его в ноль.
  heading(level: 2, outlined: true, bookmarked: true)[#title]

  block(
    fill: card-bg,
    inset: (x: 22pt, y: 18pt),
    radius: 8pt,
    stroke: (left: 4pt + theme.accent, rest: 0.7pt + divider),
    width: 100%,
    below: 24pt,
  )[
    // ── Визуальный заголовок ─────────────────────────────────────────────
    #text(size: 22pt, weight: "bold", fill: theme.accent)[#title]
    #v(4pt)
    #text(size: 10.5pt, style: "italic", fill: muted)[#description]

    #v(10pt)
    #line(length: 100%, stroke: 0.5pt + divider)
    #v(10pt)

    // ── Мета-чипы ────────────────────────────────────────────────────────
    #grid(
      columns: (1fr, 1fr, 1fr),
      column-gutter: 8pt,
      _meta-chip(label: "Порции",        value: servings,  theme: theme),
      _meta-chip(label: "Подготовка",    value: prep-time, theme: theme),
      _meta-chip(label: "Приготовление", value: cook-time, theme: theme),
    )

    #v(16pt)

    // ── Ингредиенты + Шаги ───────────────────────────────────────────────
    #grid(
      columns: (2fr, 3fr),
      column-gutter: 20pt,

      [
        #text(size: 12pt, weight: "bold", fill: body-text)[Ингредиенты]
        #v(5pt)
        #list(..ingredients.map(_render-ingredient))
      ],

      [
        #text(size: 12pt, weight: "bold", fill: body-text)[Приготовление]
        #v(5pt)
        #enum(..instructions.map(step => [#step]))
      ],
    )

    // ── Заметка (опционально) ────────────────────────────────────────────
    // Дизайн: левая полоса цвета темы + метка «ПРИМЕЧАНИЕ» + текст.
    // Без эмодзи — соответствует общему тону книги.
    #if notes != none {
      v(16pt)
      block(
        width: 100%,
        inset: (left: 14pt, right: 12pt, top: 10pt, bottom: 10pt),
        radius: (right: 4pt),
        stroke: (left: 2pt + theme.accent, rest: 0.5pt + divider),
        fill: theme.light.transparentize(50%),
      )[
        #text(
          size: 7pt,
          weight: "bold",
          fill: theme.accent,
          tracking: 1.5pt,
        )[#upper("примечание")]
        #v(5pt)
        #text(size: 10.5pt, fill: body-text)[#notes]
      ]
    }
  ]
}


// ══════════════════════════════════════════════════════════════════════════════
// chapter-header — заголовок раздела книги
// ══════════════════════════════════════════════════════════════════════════════
//
// Используем [#set page(...) ...] вместо page(){...}.
// page(){...} создаёт изолированный layout-контекст, из-за чего outline
// не может разрешить location heading'а → пустой номер страницы в TOC.
// Scoped set page оставляет heading в нормальном потоке документа.
//
// heading(level: 1) с plain-text телом идёт первым — для outline/TOC.
// show heading.where(level: 1): _ => []  (в book.typ) делает его невидимым.
// Визуальный крупный текст — отдельный text(54pt, ...) ниже.
//
#let chapter-header(title: "", subtitle: "", theme: default-theme) = [
  #set page(
    margin: (x: 0pt, y: 0pt),
    fill: theme.accent,
    header: none,
    footer: none,
  )

  // Plain-text heading для outline — невидим благодаря show-rule в book.typ
  #heading(level: 1, outlined: true, bookmarked: true)[#title]

  // Декоративная полоса сверху
  #block(width: 100%, height: 4pt, fill: white.transparentize(80%))[]

  #v(1fr)

  #pad(x: 2.5cm)[
    #line(length: 15%, stroke: 1pt + white.transparentize(50%))
    #v(12pt)

    #if subtitle != "" [
      #text(size: 12pt, style: "italic", fill: white.transparentize(40%))[#subtitle]
      #v(12pt)
    ]

    // Визуальный заголовок — отдельно от heading, чтобы не влиял на TOC
    #text(size: 54pt, weight: "bold", fill: white, tracking: -1pt)[#title]
  ]

  #v(1fr)

  // Нижняя полоса с убывающими линиями
  #block(
    width: 100%,
    fill: white.transparentize(90%),
    inset: (x: 2.5cm, y: 14pt),
  )[
    #stack(
      dir: ltr,
      spacing: 8pt,
      line(length: 20pt, stroke: 0.8pt + white.transparentize(40%)),
      line(length: 10pt, stroke: 0.8pt + white.transparentize(60%)),
      line(length: 5pt,  stroke: 0.8pt + white.transparentize(75%)),
    )
  ]
]
