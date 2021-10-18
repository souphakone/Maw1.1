<?php
$headerText = '<span class="exercise-label">New exercise</span>';
$headerClass = "heading managing";
?>

<h1>Editing Field</h1>

<form action="index.php?controller=exercise&action=edit" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="&#x2713;" /><input type="hidden" name="_method" value="patch" /><input type="hidden" name="authenticity_token" value="itAjxA/fhUV5WWkBhMX1yH1krT0/QAKbUD5CaEurPvR3FBaqwjbSMnoFzC7riQnEWjhGaNwfrc6LtWjr1gXQvg==" />

    <div class="field">
        <label for="field_label">Label</label>
        <input type="text" value="" name="field[label]" id="field_label" />
    </div>

    <div class="field">
        <label for="field_value_kind">Value kind</label>
        <select name="field[value_kind]" id="field_value_kind"><option selected="selected" value="single_line">Single line text</option>
            <option value="single_line_list">List of single lines</option>
            <option value="multi_line">Multi-line text</option></select>
    </div>

    <div class="actions">
        <a class="button" href="index.php?controller=exercise&action=fields">Update field</a>
       <!-- <input type="submit" name="commit" value="Update Field" data-disable-with="Update Field" />-->
    </div>
</form>

</body>