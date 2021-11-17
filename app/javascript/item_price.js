window.addEventListener("load",()=>{

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);

    const addTax = document.getElementById("add-tax-price")
    addTax.innerHTML = (Math.floor(inputValue * 0.1));
     console.log(addTax);

    const profitNumber = document.getElementById("profit")
      const addValue = inputValue * 0.1
      profitNumber.innerHTML = (Math.floor(inputValue - addValue));
      console.log(profitNumber);
  })
})