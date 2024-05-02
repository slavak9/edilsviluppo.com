const DropArea = document.querySelector('#drop-area');
const DropAreaPdf = document.querySelector('#drop-area-pdf');
const InputFile = document.querySelector('#input-file');
const InputPdf = document.querySelector('#input-pdf');
const ImageText = document.querySelector('.img_text');
const Image = document.querySelector('#upload_img');
const FileText = document.querySelector('.text-name-file');
const SelectCatBt = document.querySelector('.select_category_button');
const SelectedH3 = document.querySelector('.selected_category_h3');
const ListCategory = document.querySelector('.select_category_container');


if(InputPdf){
    InputPdf.addEventListener('change',UploadFile)

    function UploadFile(){
        FileText.innerHTML = InputPdf.files[0].name
    };

    DropAreaPdf.addEventListener('dragover',(event)=>{
        event.preventDefault();
    });
    DropAreaPdf.addEventListener('drop',(event)=>{
        event.preventDefault();
        InputPdf.files = event.dataTransfer.files;
        UploadFile();
    });
};


if(InputFile){
    InputFile.addEventListener('change',UploadImg)
// img file 
function UploadImg(){
    let ImgLink = URL.createObjectURL(InputFile.files[0]);
    ImageText.classList.add('display_none');
    Image.classList.add('display_full');
    Image.src = ImgLink;
};

DropArea.addEventListener('dragover',(event)=>{
    event.preventDefault();
});
DropArea.addEventListener('drop',(event)=>{
    event.preventDefault();
    InputFile.files = event.dataTransfer.files;
    UploadImg();
});

///
function SetSelectedValue (event){
    const RadioElement = document.querySelector(`#post_category_${event.dataset.id}`);
    const LabelElement = document.querySelector(`.label_category_${event.dataset.id}`);
    RadioElement.checked = true;
    SelectedH3.textContent = LabelElement.textContent;
    ListCategory.classList.add('display_none');
};


document.querySelectorAll('.li_select_category').forEach(event=>{
    let RadioElement = document.querySelector(`#post_category_${event.dataset.id}`);
    if(RadioElement.checked){
        const LabelElement = document.querySelector(`.label_category_${event.dataset.id}`);
        SelectedH3.textContent = LabelElement.textContent;
    };
    event.addEventListener('click',()=>{
        SetSelectedValue(event);
    })
});

if(SelectCatBt){
SelectCatBt.addEventListener('click',()=>{
    ListCategory.classList.remove('display_none');
});}

};