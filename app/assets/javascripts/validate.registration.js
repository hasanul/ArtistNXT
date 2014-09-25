jQuery(document).ready(function(){
    if(typeof(registrationType) !== 'undefined')
    {
	if(registrationType == 'fan')
		jQuery('form#new_user').validate({
			'errorClass':'invalid',
			messages:{
			    'user[email]': {				    
				    remote: jQuery.format("This email {0} is already in use")
			    }
			}
		});
	else if(registrationType == 'artist')
	{
	    jQuery('#step1').nextAll().hide();
	    jQuery('form#new_user').validate({
			'errorClass':'invalid',
			messages:{
			    'user[email]': {				    
				    remote: jQuery.format("This email {0} is already in use")
			    }
			},
		    submitHandler:function(form)
		    {
			if(checkFullArtistFormValidation())
			    form.submit();
			else
			    return false;
		    }
	    });
	    jQuery('#step2_trigger').click(function(){
		var validateResult = jQuery('form#new_user').valid();
		if(validateResult)
		{
		    jQuery('#step1').hide().andSelf().next().show();
		    jQuery('#step1').data('validated',true);
		    jQuery('div.steps ul li').eq(1).removeClass('active');
		    jQuery('div.steps ul li').eq(1).addClass('active');
		}
	    });
	    
	    jQuery('#step3_trigger').click(function(){
		var validateResult = jQuery('form#new_user').valid();
		if(validateResult)
		{
		    jQuery('#step2').hide().andSelf().next().show();
		    jQuery('#step2').data('validated',true);
		    jQuery('div.steps ul li').eq(2).removeClass('active');
		    jQuery('div.steps ul li').eq(2).addClass('active');
		}
	    });
	    jQuery('#step4_trigger').click(function(){
		var validateResult = jQuery('form#new_user').valid();
		if(validateResult)
		{
		    jQuery('#step3').hide().andSelf().next().show();
		    jQuery('#step3').data('validated',true);
		    jQuery('div.steps ul li').eq(3).removeClass('active');
		    jQuery('div.steps ul li').eq(3).addClass('active');
		    setPreview();
		}
	    });
	    
	    jQuery('div.steps ul li').click(function(){
		var stepcheck = jQuery(this).attr('data-stepcheck');
		if(typeof(stepcheck) !== 'undefined' && stepcheck!='')
		{
		    stepcheck = parseInt(stepcheck);
		    if(stepcheck == 0)
		    {
			jQuery('#step1').nextAll().hide();
			jQuery('#step1').show();
		    }
		    else if(jQuery('#step'+stepcheck).length > 0 && jQuery('#step'+stepcheck).data('validated'))
		    {
			jQuery('#step'+(stepcheck+1)).siblings().not('div.steps').hide();
			jQuery('#step'+(stepcheck+1)).show();
		    }
		}
	    });
	    
		
	}
    }    
});
function setPreview()
{
    jQuery('#preview_plan').html(jQuery('option:selected','#user_plan_id').text());
    jQuery('#preview_fname').html(jQuery('#user_first_name').val());
    jQuery('#preview_lname').html(jQuery('#user_last_name').val());
    jQuery('#preview_email').html(jQuery('#user_email').val());
    jQuery('#preview_phone').html(jQuery('#user_phone').val());
    jQuery('#preview_country').html(jQuery('#user_country_id option:selected').text());
    jQuery('#preview_state').html(jQuery('#user_state_id option:selected').text());
    jQuery('#preview_city').html(jQuery('#user_city').val());
    jQuery('#preview_zip').html(jQuery('#user_zip').val());
    var music_label = parseInt(jQuery('.music_label:checked').val());
    var music_label_html = (music_label == 1)?'Yes':'No';
    jQuery('#preview_label').html(music_label_html);
}

function checkFullArtistFormValidation()
{
    var requiredFields = jQuery(".required",'form#new_user');
    var validationResult = true;
    jQuery(requiredFields).each(function(){
	if(jQuery.trim(jQuery(this).val()) == "")
	{
	    validationResult = false;
	    return;
	}
    });
    return validationResult;
}
