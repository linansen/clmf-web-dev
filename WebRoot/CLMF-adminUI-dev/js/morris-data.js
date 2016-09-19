
$(function() {

	
	Morris.Donut(
	    	{
	    		
	        element:"mwi_report_to_count",
	        
	        data:[
	        
	        {
	            label: "已抵达",
	            value: '240'
	        },
	        
	        {
	            label: "未抵达",
	            value: '80'
	        },
	        {
	            label: "已报到",
	            value: '150'
	        }
	         
	        ]
	 
	    });



	Morris.Bar({
		element:"mwi_guest_country_count",
		data:[
		
		     {con:'美国',persons:80},
		     {con:'英国',persons:10},
		     {con:'法国',persons:66},
		     {con:'德国',persons:92},
		     {con:'巴西',persons:40},
		     {con:'意大利',persons:10},
		     	
		     {con:'中国',persons:120},
		     {con:'俄罗斯',persons:90},
		     {con:'西班牙',persons:76},
		     {con:'白俄罗斯',persons:42},
		     {con:'阿根廷',persons:60},
		     {con:'日本',persons:60},
		     {con:'韩国',persons:20},
		     {con:'印度',persons:10},
		     {con:'巴基斯坦',persons:56},
		     {con:'哈萨克斯坦',persons:12},
		     {con:'瑞士',persons:20},
		     {con:'挪威',persons:10},
		     	
		     {con:'朝鲜',persons:40},
		     {con:'南非',persons:10},
		     {con:'斯洛伐克',persons:26},
		     {con:'埃及',persons:32},
		     {con:'以色列',persons:20},
		     {con:'沙特阿拉伯',persons:10}
		   
		   
		],
		
		xkey:'con',
		ykeys:['persons'],
		labels:['参会人数:'],
		hideHover:'auto'
		
		
	});



/*
    Morris.Area(
    {
      
      element: 'mwi_num_of_statics_in_meeting',
        
      data: [
      
       { year: '2015-08-21 14:22:00', value: '18' },
      
      { year: '2015-08-21 14:30:00', value: '5' },
    
      { year: '2015-08-21 14:40:00', value: '10' },
      
      { year: '2015-08-21 15:00:00', value: '20' },
      
      { year: '2015-08-21 15:10:00', value: '25' },
    
      { year: '2015-08-21 15:20:00', value: '3' },
       
       { year: '2015-08-21 15:22:00', value: '20' },
      
      { year: '2015-08-21 15:22:10', value: '45' },
    
      { year: '2015-08-21 15:25:00', value: '30' },
       
      { year: '2015-08-21 15:28:00', value: '18' },
      
      { year: '2015-08-21 15:30:00', value: '5' },
    
      { year: '2015-08-21 15:40:00', value: '10' },
    
    
  ],

  xkey: 'year',

  ykeys: ['value'],

  labels: ['人数'],
  
  xLabels:'minute',

    });

  */
    
   /* Morris.Line(
    	{
    		
    		element:'mwi_registration_line',
    		data:[
    		
    		{time:'2015-8-21 9:00',value:10},
    		
    		{time:'2015-8-21 10:00',value:20},
    		
    		{time:'2015-8-21 11:00',value:16},
    		
    		{time:'2015-8-21 14:00',value:38},
    		
    		{time:'2015-8-21 15:00',value:26},
    		
    		{time:'2015-8-21 16:00',value:48},
    		
    		{time:'2015-8-22 9:00',value:20},
    		
    		{time:'2015-8-22 10:00',value:40},
    		
    		{time:'2015-8-22 11:00',value:66},
    		
    		{time:'2015-8-22 14:00',value:8},
    		
    		{time:'2015-8-22 15:00',value:16},
    		
    		{time:'2015-8-22 16:00',value:48}
    		
    	],
    	xkey:'time',
    	ykeys:['value'],
    	labels:['人数'],
    	xLabels:'hour',
    	lineColors:'red',
    	pointFillColors:'white',
    	hideHover:'auto',
    	smooth:false,
    	grid:true
    	
    	}
    	
    );
    
   
*/

/*
     Morris.Donut(
    	{
    		
        element: 'mwi_audit_pass_donut',
        
        data: [
        {
            label: "审核已通过人数",
            value: '140'
        },
        
        {
            label: "接收待审核人数",
            value: '30'
        },
        {
            label: "未审核",
            value: '300'
        }, {
            label: "审核失败",
            value: '6'
        }
        
        ]
 
    });
    
   */  



/*

    Morris.Bar({
        element: 'morris-bar-chart',
       
	data:[
	     {pos:'志愿者',persons:120,up:10},
	     {pos:'工作人员',persons:100,up:20},
	     {pos:'参会外宾',persons:126,up:5},
	     {pos:'参会内宾',persons:82,up:1},
	   
	    
	   
	],
	
	xkey:'pos',
	ykeys:['persons','up'],
	labels:['天昊酒店住宿人数:','万俊酒店住宿人数:'],
	hideHover:'auto'
	
	
        
       
    });

*/

/*
Morris.Bar({
	element:'myBar',
	data:[
	     {pos:'天昊酒店志愿者用餐',persons:120,up:10},
	     {pos:'天昊酒店工作人员用餐',persons:100,up:20},
	     {pos:'天昊酒店参会嘉宾用餐',persons:126,up:5},
	     {pos:'万俊酒店志愿者用餐',persons:82,up:1},
	     {pos:'万俊酒店工作人员用餐',persons:80,up:0},
	     {pos:'万俊酒店参会嘉宾用餐',persons:110,up:10}
	    
	   
	],
	
	xkey:'pos',
	ykeys:['persons','up'],
	labels:['用餐人数:','未用餐人数:'],
	hideHover:'auto'
	
	
	
	
});


*/


/*
Morris.Bar({
	element:'myfirstchart',
	data:[
	
	     {pos:'路线A(仁怀-赤水-桐梓-遵义-铜仁(贵州北线))',persons:20},
	     {pos:'路线B(织金-六盘水－安顺-兴义(贵州西南线))',persons:10},
	     {pos:'路线C(独山-荔波-榕江-黎平(贵州东南线))',persons:26},
	     {pos:'路线D(汕头华侨试验区-南澳岛-潮州（广东线))',persons:12},
	     {pos:'路线E(兰州-敦煌-阿克苏-乌鲁木齐（甘肃新疆线))',persons:20},
	     {pos:'路线F(甘孜-阿坝藏区（四川线))',persons:10},
	   
	],
	
	xkey:'pos',
	ykeys:['persons'],
	labels:['参会人数:'],
	hideHover:'auto'
	
	
});

*/







});

