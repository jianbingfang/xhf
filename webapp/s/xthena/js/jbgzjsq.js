
/*model.fgyxz == 1 试用期
model.fgyxz == 2  实习期
model.fgyxz == 3正式
model.fgyxz == 4离职*/



var base = 800;
 function jbgzjsq(xueli,byz,gyxz,bysj) {
	// alert(xueli+"  "+byz+"  "+gyxz+"  "+bysj);
	 var dt = new Date(Date.parse(bysj.replace(/-/g, "/")));
	 if(xueli>5)xueli = 5;
	 if(xueli <1 )xueli = 1;
	if(byz==2 ){
		if(gyxz == 1){
			if(xueli==1){
				return base;	
			};
			if(xueli==2){
				return base+100;	
			};
			if(xueli==3){
				return base+200;	
			};
		}
		else if(gyxz == 2){
			if(xueli==1){
				return base+200;	
			};
			if(xueli==2){
				return base+300;	
			};
			if(xueli==3){
				return base+400;	
			};
		}
	};
	
	var date = new Date();
	var dateYear = date.getFullYear();
	var bysjYear = dt.getFullYear();
	var dateMonth = date.getMonth();
	var bysjMonth = dt.getMonth();
	var dateDay = date.getDay();
	var bysjDay = dt.getDay();
	var bynx = 0;
		var result = dateYear -bysjYear;
		if(result <= 0){
			bynx = 0;
		}
		else if (result >0){
			var monthResult = dateMonth-bysjMonth;
			if(monthResult<0){
				bynx =  result-1;
				
			}else if(monthResult==0){
				var dayResult = dateDay-bysjDay;
				if(dayResult<0){
					bynx = result-1;
				}else if(dayResult>=0){
					bynx = result;
				}
				
			}else if(monthResult>0){
				bynx = result;
			}
		};
	if(byz==1){
		if(gyxz == 1){
			if(xueli==1){
				return base;	
			};
			if(xueli==2){
				return base+100;	
			};
			if(xueli==3){
				return base+200;	
			};
		}else if(gyxz == 2){
			if(xueli==1){
				return base+200;	
			};
			if(xueli==2){
				return base+300;	
			};
			if(xueli==3){
				return base+400;	
			};
		}
		else if (gyxz==3){
			if(bynx<3){
				if(xueli==1){
					return base+500+bynx*100;	
				};
				if(xueli==2){
					return base+600+bynx*100;		
				};
				if(xueli==3){
					return base+700+bynx*100;	
				};
			}else if(bynx>=3 && bynx<=14){
				if(xueli==1){
					return base+700+(bynx-2)*50;	
				};
				if(xueli==2){
					return base+800+(bynx-2)*50;		
				};
				if(xueli==3){
					return base+900+(bynx-2)*50;	
				};
			}else if(bynx>14){
				if(xueli==1){
					return base+1300;	
				};
				if(xueli==2){
					return base+1400;		
				};
				if(xueli==3){
					return base+1500;	
				};
			}
		}
			
	}; 
};
