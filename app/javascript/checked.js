// function check() {
//   const posts = document.querySelectorAll(".price-input");
//   price_input.forEach(function (item) {
//     item.addEventListener("click", () => {
//       const itemId = item.getAttribute("item-price");
//       const XHR = new XMLHttpRequest();
//       XHR.open("GET", `/items/${itemId}`, true);
//       XHR.responseType = "json";
//       XHR.send();
//     } );
//   } );
// }
// window.addEventListener("load",check)

function price(){
  // 画面が読み込まれた時に動くように定義する
   const priceInput = document.getElementById("item-price");
   const add_tax = document.getElementById("add-tax-price");//販売手数料
   const profit = document.getElementById("profit");//販売利益
   // 価格入力時に手数料、利益計算
     priceInput.addEventListener('keyup', () => {
         const value = priceInput.value; //value（入力の金額を定義）
         
       if (value >= 300 && value <= 9999999){
         let fee = value * 0.1
         let gains = value - fee
         add_tax.textContent = fee;
         profit.textContent = gains;
     } else {
       let fee = '-';
       let gains = '-';
       add_tax.textContent = fee;
       profit.textContent = gains;
     }
   });
  
  }
  window.addEventListener('load', price);