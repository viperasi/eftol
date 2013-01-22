var zp = function(config)
{
	var config = config ? config : {};
	var title,
		container,
		guid;
	var isShow = false;
	var $this = {};
	var pid = 'zp-panel' + guid;
	
	function _init_()
	{
		title = config.title ? config.title : '';
		container = config.container ? config.container : $('body');
		guid = _guidGenerator_();
		_genInitHTML_();
	}
	
	function _genInitHTML_()
	{
		$("<div>").addClass('zp').addClass('panel').attr(
			{
				'id'		:'zp_'+guid
			}
		).append(
			$("<div>").addClass('zp-panel').attr(
				{
					'id'	:'zpp_'+guid
				}
			).append(
				$("<span>").addClass('zpjz1').append('0.0')
			).append(
				$("<span>").addClass('zpjz2').append('400.0')
			).append(
				$("<span>").addClass('zprl1').append('23.6')
			).append(
				$("<span>").addClass('zprl2').append('400.0 m3')
			).append(
				$("<span>").addClass('zpwr1').append('0.0')
			).append(
				$("<span>").addClass('zpwr2').append('0.0 m3')
			).append(
				$("<span>").addClass('zpcpu').append('195.5/195.5')
			).append(
				$("<span>").addClass('zpen').append('85.5/85.5')
			).append(
				$("<img>").attr(
					{
						'src'	:'images/arr.png'
					}
				).addClass('arr').click(function()
				{
					$("#zpt_"+guid).toggle();
				})
			)
		).append(
			$("<div>").addClass('zp-table').attr(
				{
					'id'		:'zpt_'+guid
				}
			)
		).click(function()
		{
			$(this).css('z-index',maxZ++);	
		}).appendTo(container).draggable();
	}
	
	/*gen guid*/
	function _guidGenerator_() 
	{
	    var S4 = function() {
	       return (((1+Math.random())*0x10000)|0).toString(16).substring(1);
	    };
	    return (S4()+S4()+"-"+S4()+"-"+S4()+"-"+S4()+"-"+S4()+S4()+S4());
	}
	
	_init_();
};
