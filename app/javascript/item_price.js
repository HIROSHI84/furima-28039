// window.addEventListener('load', () => {
//     console.log("ok");
// })

window.addEventListener("DOMContentLoaded", () => {
    const path = location.pathname
    const pathRegex = /^(?=.*item)(?=.*edit)/
    if (path === "/items/new" || path === "/items" || pathRegex.test(path)) {
      

const priceInput = document.getElementById("item-price");
const addTaxDom = document.getElementById("add-tax-price");
const profitDom = document.getElementById("profit");

priceInput.addEventListener("input", () => {
    const inputValue = document.getElementById("item-price").value;
      let tax = Math.floor(inputValue * 0.1).toLocaleString(); 
      addTaxDom.innerHTML = tax ;
      profitDom.innerHTML = (inputValue - tax).toLocaleString();
  })
   }
   });