

function check(checked = true) {
    const cbs = document.querySelectorAll('input[name="color"]');
    cbs.forEach((cb) => {
        cb.checked = checked;

        console.log('function check(checked = true) -->>>> entered');
    });
}


function checkAll() {
    console.log('function checkAll() -->>> entered');
    check();
    // reassign click event handler
    // this.onclick = uncheckAll;
}

function uncheckAll() {
    check(false);

    console.log('function uncheckAll() -->>> entered');
    // reassign click event handler
    // this.onclick = checkAll;
}

function SelectedAllClick() {
    const btn = document.querySelector('#btn');
    // btn.onclick = checkAll;
    // if (btn.checked != true){
    
    // }

    console.log('SelectedAllClick entered this.checked = ' + btn.checked);


    // document.querySelector('#btn').onclick()
    // {
    (btn.checked === true) ? checkAll() : uncheckAll();
    // }
    
    updateTotalMoney(); 
}

function isSelectedAll() {

    console.log('tooi da vao selectAll checking');

    const cbs = document.querySelectorAll('input[name="color"]');

    var isSelectedAll = true;
    
    cbs.forEach((cb) => {


        console.log('gia tri = ' + cb.checked);


        // console.log("gia tri " + cb.checked);
        if (cb.checked === false) {
            isSelectedAll = false;
        };
    });

    document.querySelector('#btn').checked = ((isSelectedAll) ? true : false);
    updateTotalMoney();
}


$(".qty-decrease").bind( "click", function() {
    console.log('fucntion qtyDecreaseImpl enterd =  ' + $( this ).next('input').val());

    var target = parseInt($( this ).next('input').val());
    if(target == 0)
    {
        return;
    }
    target -=1;
    $( this ).next('input').val(target);

    var par = $(this).closest('.row');
    updatePiceItem(par, target);
    updateTotalMoney();

});


$(".qty-increase").bind( "click", function() {
    console.log('fucntion qtyDecreaseImpl enterd =  ' + $( this ).prev('input').val());

    var target = parseInt($( this ).prev('input').val())  + 1;
    $( this ).prev('input').val(target);

    var par = $(this).closest('.row');
    updatePiceItem(par, target);
    updateTotalMoney();
});


function onDeleteAllItemSelected(){
    
    let totalItemDel = 0
	
	// delete items which checked box -> true 
	// count number of deleted items use for later
    const cbs = document.querySelectorAll('input[name="color"]');
    cbs.forEach((cb) => {
        if(cb.checked === true){
            deleteItem(cb);
            totalItemDel++;
        }
    });

	// if do remove any item -> warning 
	// other wise, update TotalMoney.
    if( totalItemDel == 0 )
    {
        alert("Please select item that you want remove");
    }
    else{
        updateTotalMoney();
    }
}

function onDeleteItem( item){
    deleteItem(item)  
    updateTotalMoney();
}


function deleteItem(item)
{
    var dam = item.closest(".glclPp");
    dam.remove();
}


function updateTotalMoney(){
    const cbs = document.querySelectorAll('input[name="color"]');

    let moneyOfItem = document.querySelectorAll('.intended__final-prices');
    let target = document.querySelectorAll('.qty-input');
    let totalValue = 0;
    console.log(moneyOfItem);
    let i = 0;
    cbs.forEach((cb) => {
        if(cb.checked === true){
            totalValue  += parseStringToInt(moneyOfItem[i].innerHTML);
        }
        i++;
    });
    
    $('.acture_prices__value').text(buildStringMoney(totalValue));
    console.log(totalValue)
    //get giam gia trên theo max san pham hoac theo don hang
    var decreaseValue = document.querySelector(".fake_prices__value");

     // update tong gia tri don hang.
     totalValue -= parseStringToInt(decreaseValue.innerHTML);
     console.log("tong gia tri don hang:",totalValue)
    $('.prices__value--final').text(buildStringMoney(totalValue));
}

function updatePiceItem(element, taget){
     let childUnit = element.find(".intended__real-prices");
     let totalValue = taget * parseStringToInt(childUnit[0].innerText);
     let finalMonye = element.find(".intended__final-prices");
     finalMonye[0].innerText = buildStringMoney(totalValue);
}


function buildStringMoney( moneyValue ){
    if(moneyValue <= 0)
    {
        return "0đ";
    }

    let stringMoney = moneyValue.toString();
    let strReturn = "đ";
    for(let i = stringMoney.length; i > 0; i-=3 )
    {   if(i - 3 > 0)
        {
            strReturn = stringMoney.slice(i - 3,i) + "." + strReturn;
        }
        else
        {
            strReturn = stringMoney.slice(0,i) + "." + strReturn;
        }

    } 
    strReturn = strReturn.replace(".đ","đ");
    return strReturn;
}

function parseStringToInt(strinValue)
{
    const strSplits = strinValue.split(".");
    let money = 0;
    strSplits.forEach( strSplit=> {
        if(money === 0)
        {
            money = parseInt(strSplit);
        }
        else
        {
            money = money*1000 +  parseInt(strSplit);
        }
    });

   return money;
}