const ListMenu = document.querySelector('#list_menu');
const LanguageUL = document.querySelector('.languages_ul');
let BVal;
document.querySelector('body').addEventListener('click',(event)=>{
    if(event.target.id === 'app_img_id' & !ListMenu.classList.contains('display_flex')){
        ListMenu.classList.remove('display_menu')
        ListMenu.classList.add('display_flex')
    }else if(event.target.id === 'languages_img' || event.target.id === 'languages_p' & LanguageUL.classList.contains('display_none')){
        LanguageUL.classList.remove('display_none')
    }
    else{
        ListMenu.classList.remove('display_flex')
        ListMenu.classList.add('display_menu')
        LanguageUL.classList.add('display_none')
    }
})





