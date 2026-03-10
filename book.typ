// ══════════════════════════════════════════════════════════════════════════════
// book.typ — точка входа
// ══════════════════════════════════════════════════════════════════════════════

#import "styles/components.typ": chapter-header, accent
#import "styles/colors.typ": themes

// ── Настройки документа ───────────────────────────────────────────────────
#set document(title: "Книга рецептов")
#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 2.8cm),
  header: context {
    let chapters = query(heading.where(level: 1).before(here()))
    if chapters.len() > 0 {
      let current = chapters.last()
      [
        #align(right,
          text(8.5pt, style: "italic", fill: rgb("#BBBBBB"))[#current.body]
        )
        #v(3pt)
        #line(length: 100%, stroke: 0.3pt + rgb("#E8E4E0"))
      ]
    }
  },
  footer: context align(center,
    text(9pt, fill: rgb("#AAAAAA"))[
      — #counter(page).display("1") —
    ]
  ),
)
#set text(
  font: "Liberation Serif",
  size: 11pt,
  lang: "ru",
  fill: rgb("#2C2C2C"),
)
#set par(leading: 0.7em, spacing: 1.2em)

// ── Show-rules для heading'ов ─────────────────────────────────────────────
// Heading'и используются исключительно для outline/TOC и гиперссылок.
// Тело heading'а — plain text (например, [Супы] или [Томатный суп]).
// Визуальное оформление задаётся отдельными text(...)[...] элементами
// внутри recipe() и chapter-header().
// _ => [] делает heading полностью невидимым, но он остаётся в дереве
// документа и корректно отслеживается outline'ом.
#show heading.where(level: 1): _ => []
#show heading.where(level: 2): _ => []

// ── Обложка ───────────────────────────────────────────────────────────────
#include "chapters/00-cover.typ"

// ── Содержание ────────────────────────────────────────────────────────────
#include "chapters/01-toc.typ"

// ══════════════════════════════════════════════════════════════════════════════
// Разделы. Добавляйте новые #include по мере роста книги.
// ══════════════════════════════════════════════════════════════════════════════

// ── Супы ─────────────────────────────────────────────────────────────────
#chapter-header(title: "Супы", subtitle: "Горячие и холодные — на все сезоны", theme: themes.tomato)
#include "recipes/soups/tomato-soup.typ"
// #include "recipes/soups/borscht.typ"
// #include "recipes/soups/gazpacho.typ"

// ── Основные блюда ────────────────────────────────────────────────────────
#chapter-header(title: "Основные блюда", subtitle: "Насытить свой животик - самое то",  theme: themes.herb)
#include "recipes/mains/korean-ginger-rice.typ"
#include "recipes/mains/fast-ginger-rice.typ"
// #include "recipes/mains/roast-chicken.typ"

// ── Салаты ────────────────────────────────────────────────────────────────
#chapter-header(title: "Салаты", subtitle: "Когда хочется чего-нибудь легкого", theme: themes.avocado)
#include "recipes/salads/olivier.typ"
// #include "recipes/salads/caesar.typ"

// ── Выпечка и десерты ─────────────────────────────────────────────────────
// #chapter-header(title: "Выпечка и десерты", theme: themes.chocolate)
// #include "recipes/desserts/brownies.typ"
