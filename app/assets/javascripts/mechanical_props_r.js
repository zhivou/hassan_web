function handleChange(input) {
    if (input.value < 0) input.value = 0;
    if (input.value > 0.4) input.value = 0.4;
}

function handleStructure(input) {
    if (input.value < 0) input.value = 0;
    if (input.value > 100) input.value = 100;
}

function handleFormAppear() {
    $('#formContainer').css('display', 'block');
    $('#newCalcButton').css('display', 'none');
}