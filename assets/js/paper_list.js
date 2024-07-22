function filter_list() {
  let list = document.querySelector('.paper-list');
  let items = Array.from(list.querySelectorAll('.paper'));
  let search = document.querySelector('.quicksearch');
  let search_query = search.value.toLowerCase();

  let all_buttons = Array.from(document.querySelectorAll('.category-button'));
  let top_buttons = Array.from(document.querySelectorAll('.button-box .category-button'))
  let toggled_buttons = Array.from(document.querySelectorAll('.button-box .category-button.is-checked'))
  let selected_categories = toggled_buttons.map(b => b.getAttribute('data-filter'));

  // toggle matching items
  items.forEach((e) => {
    // has matching categories
    let item_categories = e.getAttribute('data-filter').toLowerCase();
    let in_categories = selected_categories.every(cat => item_categories.includes(cat));
    // text matches search
    let content = e.textContent.toLowerCase();
    let matches_search = content.includes(search_query);
    in_categories && matches_search ? e.classList.remove('collapsed') : e.classList.add('collapsed') ;
  })

}

function toggle_buttons(button) {
  let button_category = button.target.getAttribute('data-filter');
  let matching_buttons = Array.from(document.querySelectorAll(`.category-button[data-filter=${button_category}]`));
  matching_buttons.forEach(b => b.classList.toggle('is-checked'));
  filter_list()
  
}

document.addEventListener("DOMContentLoaded", () => {
  let all_buttons = Array.from(document.querySelectorAll('.category-button'));
  all_buttons.forEach(b => {
    b.addEventListener('click', toggle_buttons);
  })
  let search = document.querySelector('.quicksearch');
  search.addEventListener('keyup', () => filter_list());
})