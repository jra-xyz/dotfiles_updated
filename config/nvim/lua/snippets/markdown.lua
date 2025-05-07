local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  markdown = {

    -- Math environments
    s("/inlinemath", { t("\\( "), i(1), t(" \\)") }),
    s("/equation", { t({ "$$", "" }), i(1, "E = mc^2"), t({ "", "$$" }) }),
    s("/alignedequation", {
      t({ "$$", "\\begin{align*}" }),
      i(1, "a + b &= c \\\\"), i(2, "x &= y + z"),
      t({ "\\end{align*}", "$$" }),
    }),
    s("/numberedequation", {
      t({ "$$", "\\begin{align}" }),
      i(1, "f(x) &= x^2 + 3x + 2 \\\\"), i(2, "g(x) &= \\sin(x) + \\cos(x)"),
      t({ "\\end{align}", "$$" }),
    }),
    s("/cases", {
      t({ "$$", "\\begin{cases}" }),
      i(1, "x^2 & x \\geq 0 \\\\"), i(2, "-x & x < 0"),
      t({ "\\end{cases}", "$$" }),
    }),

    -- Common math macros
    s("/fraction", { t("\\frac{"), i(1), t("}{"), i(2), t("}") }),
    s("/sqrt", { t("\\sqrt{"), i(1), t("}") }),
    s("/realnumbers", { t("\\mathbb{R}") }),
    s("/powerset", { t("\\mathcal{P}") }),
    s("/sub", { t("_{"), i(1), t("}") }),
    s("/sup", { t("^{"), i(1), t("}") }),
    s("/subsup", {
      t("^{"), i(1, "upper"), t("}_{"), i(2, "lower"), t("}"),
    }),

    -- Greek letters
    s("/alpha", { t("\\alpha") }),
    s("/beta", { t("\\beta") }),
    s("/gamma", { t("\\gamma") }),
    s("/delta", { t("\\delta") }),
    s("/epsilon", { t("\\epsilon") }),
    s("/theta", { t("\\theta") }),
    s("/lambda", { t("\\lambda") }),
    s("/mu", { t("\\mu") }),
    s("/pi", { t("\\pi") }),
    s("/sigma", { t("\\sigma") }),
    s("/phi", { t("\\phi") }),
    s("/omega", { t("\\omega") }),

    -- Set theory and logic
    s("/subset", { t("\\subset") }),
    s("/propersubset", { t("\\subsetneq") }),
    s("/supset", { t("\\supset") }),
    s("/union", { t("\\cup") }),
    s("/intersect", { t("\\cap") }),
    s("/in", { t("\\in") }),
    s("/notin", { t("\\notin") }),
    s("/implies", { t("\\Rightarrow") }),
    s("/impliedby", { t("\\Leftarrow") }),
    s("/iff", { t("\\Leftrightarrow") }),
    s("/and", { t("\\land") }),
    s("/or", { t("\\lor") }),
    s("/not", { t("\\neg") }),
    s("/exists", { t("\\exists") }),
    s("/forall", { t("\\forall") }),
    s("/provable", { t("\\vdash") }),
    s("/models", { t("\\models") }),

    -- Logic blocks
    s("/forallx", {
      t("\\forall "), i(1, "x"), t(" \\in "),
      i(2, "\\mathbb{R}"), t(", "), i(3, "statement"),
    }),
    s("/existsx", {
      t("\\exists "), i(1, "x"), t(" \\in "),
      i(2, "\\mathbb{R}"), t(", "), i(3, "statement"),
    }),
    s("/setbuilder", {
      t("\\{ "), i(1, "x"), t(" \\in "), i(2, "A"),
      t(" \\mid "), i(3, "condition"), t(" \\}"),
    }),
    s("/contrapositive", {
      t("> [!proof] Proof by Contrapositive"), t({ "", "> " }),
      t("To prove that \\( "), i(1, "P \\Rightarrow Q"), t(" \\), we assume \\( \\neg "),
      i(2, "Q"), t(" \\) and show that \\( \\neg "), i(3, "P"), t(" \\)."),
    }),

    -- Structural callouts
    s("/theorem", {
      t("> [!theorem] "), i(1, "Theorem Name"), t({ "", "> " }),
      i(2, "Statement of the theorem."),
    }),
    s("/corollary", {
      t("> [!corollary] "), i(1, "Corollary Name"), t({ "", "> " }),
      i(2, "Statement of the corollary."),
    }),
    s("/proposition", {
      t("> [!proposition] "), i(1, "Proposition Name"), t({ "", "> " }),
      i(2, "Statement of the proposition."),
    }),
    s("/definition", {
      t("> [!definition] "), i(1, "Term"), t({ "", "> " }),
      i(2, "Definition goes here."),
    }),
    s("/proof", {
      t("> [!proof] Proof"), t({ "", "> " }), i(1, "Start of proof..."),
      t({ "", "", "> \\qed" }),
    }),

    -- Visuals
    s("/matrix", {
      t({ "$$", "\\begin{bmatrix}" }),
      i(1, "a & b \\\\ c & d"),
      t({ "\\end{bmatrix}", "$$" }),
    }),
    s("/image", {
      t("!["), i(1, "Caption"), t("]("), i(2, "path/to/image.png"), t(")"),
    }),
    s("/diagram", {
      t("### Visual Intuition"), t({ "", "" }),
      t("!["), i(1, "caption"), t("]("), i(2, "path/to/image.png"), t(")"),
      t({ "", "" }),
      t("This illustrates: "), i(3, "concept or explanation."),
    }),

    -- TikZ templates
    s("/tikz", {
      t({ "$$", "\\begin{tikzpicture}" }),
      i(1, "% your diagram here"),
      t({ "\\end{tikzpicture}", "$$" }),
    }),
    s("/tikzgrid", {
      t({ "$$", "\\begin{tikzpicture}[scale=1]" }),
      t("\\draw[step=1cm,gray,very thin] (-3,-3) grid (3,3);"),
      t("\\draw[->] (-3,0) -- (3.2,0) node[right] {$x$};"),
      t("\\draw[->] (0,-3) -- (0,3.2) node[above] {$y$};"),
      i(1, "% Add content here"),
      t({ "\\end{tikzpicture}", "$$" }),
    }),
    s("/tikzarrowmap", {
      t({ "$$", "\\begin{tikzpicture}[->, thick]" }),
      t("\\node (A) at (0,1) {$A$};"),
      t("\\node (B) at (2,1) {$B$};"),
      t("\\draw (A) to node[above] {$f$} (B);"),
      i(1, "% Add more mappings or labels"),
      t({ "\\end{tikzpicture}", "$$" }),
    }),
    s("/tikzvector", {
      t({ "$$", "\\begin{tikzpicture}[scale=1]" }),
      t("\\draw[->, thick] (0,0) -- (2,1) node[above right] {$\\vec{v}$};"),
      t("\\draw[->] (-3,0) -- (3,0) node[right] {$x$};"),
      t("\\draw[->] (0,-2) -- (0,2) node[above] {$y$};"),
      i(1, "% Optional annotation"),
      t({ "\\end{tikzpicture}", "$$" }),
    }),

    -- New note template
    s("/newnote", {
      t("# "), i(1, "Title"), t({ "", "", "## Summary", "", "" }),
      i(2, "Brief summary or definition of the concept."), t({ "", "", "## Details", "", "- " }),
      i(3, "Explanation or examples"), t({ "", "- $$" }),
      i(4, "LaTeX equation"), t({ "$$", "", "", "## Related", "", "- [[" }),
      i(5, "related-concept-1"), t("]]", { "", "- [[" }),
      i(6, "related-concept-2"), t("]]"),
    }),
  },
}
