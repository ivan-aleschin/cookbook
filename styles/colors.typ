// ══════════════════════════════════════════════════════════════════════════════
// styles/colors.typ — 16 гармоничных кулинарных тем
// ══════════════════════════════════════════════════════════════════════════════
//
// Каждая тема — словарь с ключами:
//   accent       — основной цвет (заголовок, левая полоса, чипы)
//   light        — бледный фон чипов и заметок
//   note-stroke  — цвет обводки блока заметки
//
// Использование в рецепте:
//   #recipe(theme: themes.tomato, ...)
// ──────────────────────────────────────────────────────────────────────────────

#let themes = (

  // ── Красные / тёплые ──────────────────────────────────────────────────────

  // помидоры, томатный соус, перец
  tomato: (
    accent:      rgb("#C0392B"),
    light:       rgb("#FDECEA"),
    note-stroke: rgb("#EF9A9A"),
  ),

  // тыква, морковь, батат
  pumpkin: (
    accent:      rgb("#CA6F1E"),
    light:       rgb("#FEF0E6"),
    note-stroke: rgb("#FFAB76"),
  ),

  // лосось, розе, клубника
  salmon: (
    accent:      rgb("#C0616E"),
    light:       rgb("#FDECEE"),
    note-stroke: rgb("#F4A0AB"),
  ),

  // свёкла, вишня, красное вино, гранат
  beet: (
    accent:      rgb("#7B241C"),
    light:       rgb("#FDEDEC"),
    note-stroke: rgb("#CE8F8B"),
  ),

  // ── Жёлтые / золотые ─────────────────────────────────────────────────────

  // мёд, горчица, кукуруза, карри
  honey: (
    accent:      rgb("#B7770D"),
    light:       rgb("#FEF9E6"),
    note-stroke: rgb("#FFD54F"),
  ),

  // лимон, яичный желток, ванильный крем
  lemon: (
    accent:      rgb("#9A7D0A"),
    light:       rgb("#FDFDE7"),
    note-stroke: rgb("#F9E04B"),
  ),

  // ── Зелёные ──────────────────────────────────────────────────────────────

  // авокадо, фисташки, молодой горошек
  avocado: (
    accent:      rgb("#27AE60"),
    light:       rgb("#E9F7EF"),
    note-stroke: rgb("#82D9A5"),
  ),

  // базилик, шпинат, петрушка, зелёные соусы
  herb: (
    accent:      rgb("#1E6B3B"),
    light:       rgb("#E8F6EF"),
    note-stroke: rgb("#6DBF8F"),
  ),

  // мята, лайм, огурец, смузи
  mint: (
    accent:      rgb("#0E9E87"),
    light:       rgb("#E6F9F6"),
    note-stroke: rgb("#62D4C5"),
  ),

  // ── Синие / бирюзовые ────────────────────────────────────────────────────

  // морепродукты, рыба, дары моря
  ocean: (
    accent:      rgb("#1A6FA3"),
    light:       rgb("#EAF3FB"),
    note-stroke: rgb("#7BBCE0"),
  ),

  // черника, голубика, ежевика
  blueberry: (
    accent:      rgb("#2C5F8A"),
    light:       rgb("#EBF2FA"),
    note-stroke: rgb("#7FACD3"),
  ),

  // ── Фиолетовые ───────────────────────────────────────────────────────────

  // баклажан, ежевика, фиолетовый базилик
  eggplant: (
    accent:      rgb("#6C3483"),
    light:       rgb("#F4ECF7"),
    note-stroke: rgb("#B88DC8"),
  ),

  // лаванда, чернослив, ягодные десерты
  lavender: (
    accent:      rgb("#7D3C98"),
    light:       rgb("#F5EEF8"),
    note-stroke: rgb("#C39BD3"),
  ),

  // ── Коричневые / тёмные ──────────────────────────────────────────────────

  // шоколад, какао, десерты
  chocolate: (
    accent:      rgb("#5D4037"),
    light:       rgb("#EFEBE9"),
    note-stroke: rgb("#A98274"),
  ),

  // кофе, корица, специи, выпечка
  coffee: (
    accent:      rgb("#4E342E"),
    light:       rgb("#F3EAE8"),
    note-stroke: rgb("#9C7B74"),
  ),

  // грибы, трюфели, ореховые соусы
  mushroom: (
    accent:      rgb("#7E6B4A"),
    light:       rgb("#F5F0E8"),
    note-stroke: rgb("#C4AE89"),
  ),
)

// Тема по умолчанию (используется, если theme не передан)
#let default-theme = themes.tomato
