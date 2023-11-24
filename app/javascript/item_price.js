window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");

    // 販売手数料の計算（10%）
    const fee = Math.floor(inputValue * 0.1);
    addTaxDom.innerHTML = fee;

    // 販売利益の計算（価格から手数料を引いた金額）
    const profit = inputValue - fee;
    profitDom.innerHTML = profit;
  });
});