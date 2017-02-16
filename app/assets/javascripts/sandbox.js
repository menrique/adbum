$( document ).ready(function() {

    // Get the API parameters
    var tags = $('#tags').val(),
        limit = $('#limit').val(),

        // Build the API URL
        apiUrl = $('#url').html() +
            '?tags=' + tags +
            '&limit=' + limit,

        // GEt the result container
        resultComponent = $('#result');

    // Get the JSON
    $.getJSON(apiUrl, function(data){
        renderResponse(data);
    }).fail(function(data) {
        renderResponse(JSON.parse(data.responseText));
    });

    // Render the response
    function renderResponse(data){
        var jsonString = JSON.stringify(data, null, 2);
        resultComponent.html(jsonString);
        resultComponent.parent().addClass('prettyprint');
        PR.prettyPrint();
        resultComponent.parent().removeClass('prettyprint');
    }

});