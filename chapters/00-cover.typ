// chapters/00-cover.typ

#page(
  margin: (x: 0pt, y: 0pt),
  fill: rgb("#FAFAF8"),
  footer: none,
  header: none,
  numbering: none,
)[
  // ── Верхняя акцентная полоса ──────────────────────────────────────────
  #block(
    fill: rgb("#C0392B"),
    width: 100%,
    height: 6pt,
  )[]

  #v(1fr)

  // ── Центральный блок ──────────────────────────────────────────────────
  #align(center)[
    // Декоративный элемент — три горизонтальные линии
    #stack(
      dir: ttb,
      spacing: 5pt,
      line(length: 3cm, stroke: 1.5pt + rgb("#C0392B")),
      line(length: 2cm, stroke: 0.8pt + rgb("#C0392B")),
      line(length: 1cm, stroke: 0.4pt + rgb("#C0392B")),
    )

    #v(28pt)

    #text(
      size: 46pt,
      weight: "bold",
      fill: rgb("#C0392B"),
      tracking: -0.5pt,
    )[Книга рецептов]

    #v(10pt)

    #stack(
      dir: ltr,
      spacing: 10pt,
      line(length: 2cm, stroke: 0.5pt + rgb("#E0DDD8")),
      text(size: 13pt, style: "italic", fill: rgb("#999999"))[Моя личная коллекция],
      line(length: 2cm, stroke: 0.5pt + rgb("#E0DDD8")),
    )
  ]

  #v(1fr)

  // ── Нижний колонтитул обложки ─────────────────────────────────────────
  #block(
    width: 100%,
    fill: rgb("#C0392B"),
    inset: (x: 2.5cm, y: 14pt),
  )[
    #align(right)[
      #text(size: 9pt, fill: white.transparentize(30%))[составлено с любовью]
    ]
  ]
]
