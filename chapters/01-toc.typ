#import "../styles/components.typ": accent, divider

#page(
  margin: (x: 2.5cm, y: 2.8cm),
  footer: none,
  header: none,
)[
  #v(1.2cm)

  // ── Заголовок страницы ─────────────────────────────────────────────────
  #text(size: 32pt, weight: "bold", fill: accent)[Содержание]
  #v(0.4cm)
  #line(length: 100%, stroke: 0.6pt + divider)
  #v(0.8cm)

  // ── Уровень 1 — раздел (Супы, Основные блюда…) ────────────────────────
  // Цветная левая полоса + крупный жирный текст + номер страницы акцентом
  #show outline.entry.where(level: 1): it => {
    v(20pt, weak: true)
    link(it.element.location())[
      #grid(
        columns: (4pt, 1fr, auto),
        column-gutter: 10pt,
        align: (horizon, horizon, horizon),
        // Цветная левая полоса — визуально связывает с chapter-header
        block(width: 4pt, height: 15pt, radius: 2pt, fill: accent)[],
        text(weight: "bold", size: 12pt, fill: rgb("#1A1A1A"))[#it.body()],
        text(weight: "bold", size: 12pt, fill: accent)[#it.page()],
      )
    ]
    v(6pt, weak: true)
    line(length: 100%, stroke: 0.5pt + divider)
    // Жёсткий отступ после линии — не схлопывается с weak-отступом рецепта
    v(12pt)
  }

  // ── Уровень 2 — рецепт внутри раздела ─────────────────────────────────
  #show outline.entry.where(level: 2): it => {
    v(5pt, weak: true)
    pad(left: 1.6em)[
      #link(it.element.location())[
        #grid(
          columns: (auto, 1fr, auto),
          column-gutter: 6pt,
          align: (bottom, bottom, bottom),
          text(size: 11pt, fill: rgb("#333333"))[#it.body()],
          box(
            width: 100%,
            repeat(gap: 4pt, text(size: 8pt, fill: rgb("#C8C4BE"))[·])
          ),
          text(size: 11pt, fill: rgb("#666666"))[#it.page()],
        )
      ]
    ]
  }

  // ── Само оглавление ────────────────────────────────────────────────────
  #outline(title: none, depth: 2)
]
