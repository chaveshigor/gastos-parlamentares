const btt = document.getElementById('sendDataBtt');
const loadingDiv = document.getElementById('loading-div');
const uploadDataDiv = document.getElementById('uploadDataDiv');
const fileField = document.getElementById('fileField');

btt.addEventListener('click', () => {
  if(fileField.value != '' && fileField.value != null ) {
    loadingDiv.style.display = 'flex';
    loadingDiv.style.flexDirection = 'column';
    loadingDiv.style.justifyContent = 'center';
    loadingDiv.style.alignItems = 'center';
    uploadDataDiv.style.display = 'none';
  };
});
