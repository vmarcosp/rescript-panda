type colors // type-colors

let toColor: string => colors = v => Obj.magic(v)

let rgb = (r, g, b) => toColor(`[rgb(${r->Int.toString}, ${g->Int.toString}, ${b->Int.toString})]`)
let rgba = (r, g, b, a) =>
  toColor(`[rgba(${r->Int.toString}, ${g->Int.toString}, ${b->Int.toString}, ${a->Int.toString})]`)
let hex = (color) => toColor(`[${color}]`)
let hsl = (h, s, l) => toColor(`[hsl(${h->Int.toString}, ${s->Int.toString}, ${l->Int.toString})]`)
let hsla = (h, s, l, a) => toColor(`[hsla(${h->Int.toString}, ${s->Int.toString}, ${l->Int.toString}, ${a->Int.toString})]`)
