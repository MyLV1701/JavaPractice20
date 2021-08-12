

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

}

function isSelectedAll() {

    //const checkboxes = document.querySelectorAll(`input[name="color"]:checked`);

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
}