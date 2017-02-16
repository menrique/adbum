$( document ).ready(function() {

    // Get the API parameters
    var tags = $('#tags').val(),
        limit = $('#limit').val(),

        // Build the API URL
        apiUrl = $('#url').html() +
            '?tags=' + tags +
            '&limit=' + limit,

        // Get the result container
        resultComponent = $('#result');

    // Query the API
    $.getJSON(apiUrl, function(data){
        renderResponse(data);
    }).fail(function(data) {
        renderResponse(JSON.parse(data.responseText));
    });

    // Render the response
    function renderResponse(data){
        // COnvert data from JSON to a printable String
        var jsonString = JSON.stringify(data, null, 2);

        // Display the response
        resultComponent.html(jsonString);

        // Prettify the code
        resultComponent.parent().addClass('prettyprint');
        PR.prettyPrint();
        resultComponent.parent().removeClass('prettyprint');
    }

});