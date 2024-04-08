// Generate html function
const buildHTML = (response) => {
  const product = response.item;
  const size = response.size
  const html = `
  <div class=item-list>
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
  const addForm = document.getElementById("addForm");
  addForm.addEventListener("submit", (e) => {
    e.preventDefault();
    const formData = new FormData(addForm);
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

      list.insertAdjacentHTML("afterend", buildHTML(XHR.response));
      formItemName.value = "";
      formPrice.value = "";
      formItemSize.value = "";
      formInventory.value = "";
    }
  });
};

function update_item() {
  const updateForm = document.getElementById("updateForm");
  updateForm.addEventListener("submit", (e) => {
    e.preventDefault();
    
    const formData = new FormData(updateForm);
    const url = updateForm.getAttribute("action");
    const XHR = new XMLHttpRequest();
    XHR.open("PATCH", url, true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status !== 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      };
    
      // 仮定: サーバーの応答には更新されたアイテムのIDが含まれている
      const updatedItem = XHR.response.item;
      const itemId = updatedItem.id; // 更新されたアイテムのID
      const itemElement = document.getElementById(`${itemId}`);
    
      if (itemElement) {
        // アイテムの内容を更新
        itemElement.innerHTML = `
          <div class="item">${updatedItem.item_name}</div>
          <div class="item">${updatedItem.size.attributes.name}</div>
          <div class="item">${updatedItem.price}</div>
          <div class="item">${updatedItem.number_of_inventory}</div>
          <div class="action-btn">
            <div class="edit">編集</div>
            <div class="delete">削除</div>
          </div>
        `;
      }
    };
  });
}

window.addEventListener('turbo:load', () => {
  add_item(); // 商品追加フォームの送信処理を設定
  update_item(); // 商品更新フォームの送信処理を設定
});