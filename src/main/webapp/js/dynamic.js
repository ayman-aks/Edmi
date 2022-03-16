var institute = {
  Esp: ["Laboratoire d'Informatique et réseaux Télécoms"],
  Fst: [
    "Laboratoire d'Algèbre, de Géométrie algébrique et Applications",
    "Laboratoire de Mathématiques de la décision et d'Analyse numérique",
    "Laboratoire de Mathématiques appliquées",
    "Laboratoire d'Informatique",
  ],
};
var main = document.getElementById("main_menu");
var sub = document.getElementById("sub_menu");

main.addEventListener("change", function () {
  var selected_option = institute[this.value];

  while (sub.options.length > 0) {
    sub.options.remove(0);
  }

  Array.from(selected_option).forEach(function (el) {
    let option = new Option(el, el);

    sub.appendChild(option);
  });
});
