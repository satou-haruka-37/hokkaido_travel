document.addEventListener('DOMContentLoaded', function() {
  const mapElement = document.getElementById('distance-map');
  const mapOptions = {
    center: { lat: 43.534001, lng: 142.774103 },
    zoom: 7,
    streetViewControl: false,
    mapTypeControl: false,
    fullscreenControl: false,
    keyboardShortcuts: false
  };

  const map = new google.maps.Map(mapElement, mapOptions);
  let markers = [];
  let directionsRenderer = new google.maps.DirectionsRenderer();
  let directionsService = new google.maps.DirectionsService();

  // 初期状態ではボタンを非表示にする
  document.getElementById('clear-button').style.display = 'none';

  // クリックした地点の座標を取得し、マーカーを作成
  google.maps.event.addListener(map, 'click', function(event) {
    if (markers.length < 2) {
      let clickedLocation = event.latLng;

      let marker = new google.maps.Marker({
        position: clickedLocation,
        map: map
      });

      markers.push(marker);

      // ２つのマーカーがある場合に距離を計算
      if (markers.length === 2) {
        calculateRoute(markers[0].getPosition(), markers[1].getPosition());
      }
    }
  });

  function resetMap() {
    markers.forEach(function(marker) {
      marker.setMap(null);
    });
    markers = [];
    directionsRenderer.setMap(null);
    document.getElementById('route-time').innerText = '移動時間を計測したい、2つの地点を地図上で選択してください。';

    map.setCenter(mapOptions.center);
    map.setZoom(mapOptions.zoom);
  }

  function calculateRoute(origin, destination) {
    // 北海道の境界座標を設定
    const minLat = 41.1414;
    const maxLat = 45.5515;
    const minLng = 139.8836;
    const maxLng = 145.8177;

    // 選択された地点が北海道外の場合、アラートを表示して処理を中止
    if (
      origin.lat() < minLat || origin.lat() > maxLat ||
      origin.lng() < minLng || origin.lng() > maxLng ||
      destination.lat() < minLat || destination.lat() > maxLat ||
      destination.lng() < minLng || destination.lng() > maxLng
    ) {
      window.alert('北海道内を選んでください');
      resetMap();
      return;
    }

    // ２点間の移動ルートを計算
    directionsService.route({
      origin: origin,
      destination: destination,
      travelMode: google.maps.TravelMode.DRIVING
    }, function(response, status) {
      if (status === 'OK') {
        directionsRenderer.setMap(map);
        directionsRenderer.setDirections(response);

        // 移動時間を取得して表示
        let duration = response.routes[0].legs[0].duration.text;
        document.getElementById('route-time').innerText = '移動時間：およそ 車で' + duration;

        // 結果がある場合はボタンを表示する
        document.getElementById('clear-button').style.display = 'block';
      } else {
        window.alert('ルートの取得に失敗しました');

        resetMap();
        return;
      }
    });
  }

  // 結果をクリアするボタン
  document.getElementById('clear-button').addEventListener('click', function() {
    resetMap();

    // ボタンを再び非表示にする
    document.getElementById('clear-button').style.display = 'none';
  });
});