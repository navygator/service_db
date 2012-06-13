$(function () {
    $("#Part_id").change(function () {
        var selectedPart = $(this).val();
        if (selectedPart != null && selectedPart != '') {
            $.getJSON('FreeItems', { partId: selectedPart }, function (partitems) {
                var partItemSelect = $('#PartItem_id');
                partItemSelect.empty();
                if (partItemSelect.length < 1) {
                    partItemSelect.append($('<option/>', {
                        value: "",
                        text: "Выберите запчасть"
                    }));
                }
                $.each(partitems, function (index, partitem) {
                    partItemSelect.append($('<option/>', {
                        value: partitem.Value,
                        text: partitem.Text
                    }));
                });
            });
        }
    });
});
