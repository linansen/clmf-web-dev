/*****分页*****/
page();
function page(){
	$('.pageSizeSelect').on('change',function(){
		var parentsForm = $(this).parents('form');
		if(parentsForm.length==0){
			parentsForm = document.forms[0];
			parentsForm.pageSize.value = $(this).val();
			parentsForm.pageNumber.value = 1;
		}else{
			$(parentsForm).find('input.pageSize').val($(this).val());
			$(parentsForm).find('input.pageIndex').val(1);
		}
		$(parentsForm).submit();
	});
	$('.paginator').parents('.panel-footer').find('button').on('click',function(){
		var pageNumber = $(this).siblings('input[type=number]').val();
		var parentsForm = $(this).parents('form');
		if(parentsForm.length==0){
			parentsForm = document.forms[0];
			parentsForm.pageNumber.value = pageNumber;
		}else{
			$(parentsForm).find('input.pageIndex').val(pageNumber);
		}
		$(parentsForm).submit();
	});
	var paginatorList = $('.paginator');
	for(var i=0;i<paginatorList.length;i++){
		var pageForm = $(paginatorList).eq(i).parents('form');
		if(pageForm.length==0){
			pageForm = document.forms[0];
			var pageIndex = pageForm.pageNumber.value;
			var pageSize = pageForm.pageSize.value;
			var totalPages = pageForm.totalPage.value;
		}else{
			var pageIndex = $(pageForm).find('.pageIndex').val();
			var pageSize = $(pageForm).find('.pageSize').val();
			var totalPages = $(pageForm).find('.totalPages').val();
		}
		var options = {  
			 bootstrapMajorVersion:3,
		    currentPage: pageIndex,  
		    totalPages: totalPages,  
		    size:"normal",  
		    alignment:"center",  
		    itemTexts: function (type, page, current) {  
		        switch (type) {  
		            case "first":  
		                return "第一页";  
		            case "prev":  
		                return "上一页";  
		            case "next":  
		                return "下一页";  
		            case "last":  
		                return "最后页";  
		            case "page":  
		                 return  page;  
		        }                 
		    },  
		    onPageClicked: function (e, originalEvent, type, page) {  
		    	var parentsForm = $(this).parents('form');
		    	if(parentsForm.length==0){
					parentsForm = document.forms[0];
					parentsForm.pageNumber.value = page;
				}else{
					$(parentsForm).find('input.pageIndex').val(page);
				}
		    	$(parentsForm).submit();
		    }  
		}  
		$(paginatorList).eq(i).bootstrapPaginator(options); 
	}
}


/*****分页*****/