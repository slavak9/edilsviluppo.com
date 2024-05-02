/*
const DelBT = document.querySelector('.i_delete')

DelBT.addEventListener('click',(e)=>{
    let cont = confirm('art')
    if(!cont){e.preventDefault()}
})
*/

const ConfirmWindow = document.getElementById('delete_info_container')

function DeleteAction(event){
    var form = new FormData(event.target);
    fetch(event.target.action, {
        method: 'POST',
        body: form
    });
    location.reload();
};
if(ConfirmWindow){
document.querySelectorAll('.i_delete').forEach(element=>{
        document.querySelector(`#${element.id} form`).addEventListener('submit',(event)=>{
            event.preventDefault();
            ConfirmWindow.classList.remove('display_none');
            const YesBt = document.getElementById('yes_button');
            const NoBt = document.getElementById('no_button');
            NoBt.addEventListener('click',()=>{
                ConfirmWindow.classList.add('display_none')
                location.reload();
            });
            YesBt.addEventListener('click',()=>{
                ConfirmWindow.classList.add('display_none');
                DeleteAction(event);
            });
    });
});
};