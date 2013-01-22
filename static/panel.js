var panel = function(config)
{
	var config = config ? config : {};
	var title,
		url,
		type,
		container,
		guid;
	//var isShow = false;
	var pid = 'zp-list';

	/*init function*/
	function _init_()
	{
		title = config.title ? config.title : '';
		url = config.url ? config.url : '';
		container = config.container ? config.container : $('body');
		_genInitHTML_();
		_getInitData_();
	}
	
	/*gen panel html*/
	function _genInitHTML_()
	{
		//guid = _guidGenerator_();
		$("<table>").attr(
			{
				'width'			:428,
				'border'		:0,
				'cellpadding'	:0,
				'cellspacing'	:0,
				'id'			:pid	
			}
		).addClass('panel').append(
			$("<tr>").append(
				$("<td>").attr(
					{
						'colspan'	:3
					}
				).css(
					{
						'background'		:'url(images/panel_01.gif) no-repeat',
						'width'				:'428px',
						'height'			:'24px'
					}
				).append(
					$("<span>").attr(
						{
							'id'		:'title_'+pid
						}
					).css(
						{
							'margin-left'	:'20px'
						}
					).addClass(
						'title'
					).append(
						title
					)
				).append(
					$("<span>").css(
						{
							'float'		:'right'
						}
					).append(
						$("<img>").attr(
							{
								'src'		:'images/pin_03.png',
								'id'		:'pin_'+pid
							}
						).click(
							pinActionListener
						)
					).append(
						$("<img>").attr(
							{
								'src'		:'images/min_05.png',
								'id'		:'min_'+pid
							}
						).click(
							minActionListener
						)
					).append(
						$("<img>").attr(
							{
								'src'		:'images/close_07.png',
								'id'		:'close_'+pid
							}
						).click(
							closeActionListener
						)
					)
				)
			)
		).append(
			$("<tr>").append(
				$("<td>").attr(
					{
						'colspan'			:3,
						'align'				:'right'
					}
				).css(
					{
						'background'		:'url(images/panel_02.gif) no-repeat',
						'width'				:'428px',
						'height'			:'55px'
					}
				).append(
					$("<span>").css(
						{
							'margin-right'		:'10px'
						}
					).append(
						$("<input>").attr(
							{
								'type'			:'text',
								'placeholder'	:'过滤器',
								'id'			:'search_'+pid
							}
						)
					)
				)
			)
		).append(
			$("<tr>").append(
				$("<td>").css(
					{
						'background'		:'url(images/panel_03.gif) repeat-y',
						'width'				:'7px'
					}
				)
			).append(
				$("<td>").append(
					$("<div>").css(
						{
							'width'					:'414px',
							'height'				:'500px',
							'overflow'				:'auto',
							'background-color'		:'#252525',
							'opacity'				:'0.9'
						}
					).append(
						$("<table>").attr(
							{
								'id'				:'contTb_'+pid,
								'cellpadding'		:'0',
								'cellspacing'		:'0',
								'width'				:'100%'
							}
						).addClass(
							'contTb'
						)
					)
				)
			).append(
				$("<td>").css(
					{
						'background'			:'url(images/panel_05.png) repeat-y',
						'width'					:'7px'
					}
				)
			)
		).append(
			$("<tr>").append(
				$("<td>").attr(
					{
						'colspan'				:'3'
					}
				).css(
					{
						'background'			:'url(images/panel_06.gif) no-repeat',
						'width'					:'428px',
						'height'				:'7px'
					}
				)
			)
		).draggable(
			{
				'containment'	: container, 
				'scroll'		: false
			}
		).click(function()
		{
			$(this).css('z-index',maxZ++);	
		}).appendTo(container);
	}
	
	/*pin button action*/ 
	function pinActionListener()
	{
		alert('pin clicked');
	}
	
	/*min button action*/
	function minActionListener()
	{
		$("#"+pid).hide();
	}
	
	/*close button action*/
	function closeActionListener()
	{
		$("#"+pid).remove();
	}
	
	/*list item action*/
	function itemActionListener()
	{
		var collapse = $(this).attr('collapse');
		var gid = $(this).attr('id');
		gid = gid.split('_')[2];
		if(collapse === 'true')
		{
			$('#' + type + '_' + pid + '_img_'+gid).attr(
				'src','images/arr_down.png'
			);
			$(this).attr('collapse','false');
		}
		else
		{
			$('#' + type + '_' + pid + '_img_'+gid).attr(
				'src','images/arr_up.png'
			);
			$(this).attr('collapse','true');
		}
		_getItemData_(gid,collapse,_genItemData_);
	}
	
	function _getItemData_(id,collapse,callback)
	{
		$.ajax(
			{
				url:'/getItemData',
				type:'POST',
				dataType:'json',
				data:
				{
					'id'	:id,
					'type'	:type
				},
				success:function(resp)
				{
					var o = eval('('+resp+')');
					if(o.succ)
					{
						callback(id,o.type,o.options,collapse);
					}
				}
			}
		);
	}
	
	function _genItemData_(id,t,lists,collapse)
	{
		var $obj = $('#'+type+'_'+pid+'_'+id);
		if(collapse === 'true')
		{
			$("#"+type+'_'+t+'_'+pid+'_'+id).remove();
			return;
		}
		var $div = $("<div>").attr(
			{
				'id'	:type+'_'+t+'_'+pid+'_'+id
			}
		);
		var $tb = $("<table>").attr(
			{
				'width'		:'100%'
			}
		).append(
			$("<tr>").append(
				$("<th>").attr(
					{
						'width':'70%'
					}
				).append('名称')
			).append(
				$("<th>").attr(
					{
						'width':'20%'
					}
				).append('种族')
			).append(
				$("<th>").attr(
					{
						'width':'10%'
					}
				).append('容量')
			)
		);
		$.each(lists,function(i,item)
		{
			$tb.append(
				$("<tr>").append(
					$("<td>").append(
						item.name
					)
				).append(
					$("<td>").append(
						item.race
					)
				).append(
					$("<td>").append(
						item.capacity
					)
				).click(function()
				{
					var zppanel = zp(
						{
							title:item.name
						}
					);
					return false;
				})
			)
		});
		$div.append($tb);
		$obj.append($div);
	}
	
	/*get init data*/
	function _getInitData_()
	{
		$.ajax(
		{
			url:url,
			dataType:'json',
			type:'GET',
			success:function(resp)
			{
				var o = eval('('+resp+')');
				if(o.succ)
				{
					_genInitData_(o.type,o.options);
				}
			}
		}
		);
	}
	
	/*gen init data*/
	function _genInitData_(t,lists)
	{
		var $tb = $('#contTb_'+pid);
		type = t;
		$.each(lists,function(i,item)
		{
			$tb.append(
				$("<tr>").append(
					$("<td>").attr(
						{
							'colspan'	:5,
							'id'		:type + '_' + pid + '_' + item.id,
							'collapse'	:'false'
						}
					).append(
						item.name
					).append(
						$("<span>").css(
							{
								'float':'right'
							}
						).append(
							'<img src="images/arr_down.png" id="'+ type + '_' + pid + '_img_' + item.id+'" />'
						)
					).click(
						itemActionListener
					)
				)
			);	
		});
	}
	
	_init_();
};
