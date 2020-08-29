$(function () {
  Payjp.setPublicKey('pk_test_fbd8ad7ea86e3eae45fc071c');
  $("#charge_form").on('click', function (e) {
    e.preventDefault();
    var year = $("#exp_year").val()
    var month = $("#exp_month").val()
    exp_year = String(year);
    exp_month = String(month);
    let card = {
      number: $("#number").val(),
      cvc: $("#cvc").val(),
      exp_month: exp_month,
      exp_year: exp_year
    };

    Payjp.createToken(card, function (status, response) {
      if (status === 200) {
        $("#all-form").append(
          $('<input type="hidden" name="payjp-token">').val(response.id)
        );
        $('#all-form').submit();
      } else {
        alert("カード情報が正しくありません。");
      }
    });
  });
});