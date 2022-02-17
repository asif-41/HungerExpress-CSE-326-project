

$('#input_button').on('click', function (event) {
   event.preventDefault();
   let data = $('#input_data').val();

   $.ajax({
      url: '/menu',
      method: 'post',
      data:{
          data: data
      },
      success: function (res) {
        console.log(data, res);
        $('#unordered_list').append($('<li>').text(data));
      }
   });
});
