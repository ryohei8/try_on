// Generate html function
const buildHTML = (XHR) => {
  const product = XHR.response.item;
  const size = XHR.response.size
  const html = `
  <div class=item-list></div>
    <div class="item">${product.item_name}</div>
    <div class="item">${size.attributes.name}</div>
    <div class="item">${product.price}</div>
    <div class="item">${product.number_of_inventory}</div>
    <div class="action-btn">
    <div class="edit">編集</div>
    <div class="delete">削除</div>
  </div>
  </div>`;
  return html
};




function add_item () {
  const form = document.getElementById("form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/items", true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 201) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      };
      const list = document.getElementById("list");
      const formItemName = document.getElementById("item-name")
      const formPrice = document.getElementById("price")
      const formItemSize = document.getElementById("item-size")
      const formInventory = document.getElementById("inventory")

      list.insertAdjacentHTML("beforeend", buildHTML(XHR));
      formItemName.value = "";
      formPrice.value = "";
      formItemSize.value = "";
      formInventory.value = "";
    }
  });
};

window.addEventListener('turbo:load', add_item)