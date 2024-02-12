// Place Autocomplete
document.addEventListener('DOMContentLoaded', function () {
  let inputTitle = document.getElementById('Title');
  let inputAddress = document.getElementById('Address');

  //オートコンプリートのオプション
  let options = {
    types: ['establishment'],
    componentRestrictions: { country: 'JP' },
  };

  // オートコンプリート適用
  let autocompleteTitle = new google.maps.places.Autocomplete(inputTitle, options);
  let autocompleteAddress = new google.maps.places.Autocomplete(inputAddress, options);

  // タイトルのオートコンプリートが選択されたとき
  autocompleteTitle.addListener('place_changed', function() {
    let place = autocompleteTitle.getPlace();
    inputTitle.value = place.name;
    inputAddress.value = place.formatted_address;
  });

  // 住所のオートコンプリートが選択されたとき
  autocompleteAddress.addListener('place_changed', function() {
    let place = autocompleteAddress.getPlace();
    inputTitle.value = place.name;
    inputAddress.value = place.formatted_address;
  });
});