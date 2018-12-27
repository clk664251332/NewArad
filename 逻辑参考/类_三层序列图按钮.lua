--=============================================================================--
-- ★ 三层按钮类
--=============================================================================--

类_三层序列图按钮 = class()


--=============================================================================--
-- ■ 构造函数
--=============================================================================--

function 类_三层序列图按钮:初始化(图片文件,x坐标,y坐标,竖行,提示内容,偏移x,偏移y)

	self.图片 =引擎:载入图片(图片文件) 
        
        if (竖行 == false) then

          self.单帧宽度 = 引擎:取图片宽度(self.图片)/3
          self.单帧高度 = 引擎:取图片高度(self.图片)
        
        else
          self.单帧宽度 = 引擎:取图片宽度(self.图片)
          self.单帧高度 = 引擎:取图片高度(self.图片)/3
        end

	self.禁用 = false 

	self.按钮动画 = D2D_动画.创建(self.图片, 3, 1, 0, 0, 
                                      self.单帧宽度, self.单帧高度)
	
	self.显示坐标 = {x=x坐标,y=y坐标}
	
	self.显示偏移 = {x=偏移x,y=偏移y}

	self.状态 = 1   ---- 1正常,2鼠标在上，3鼠标点击，0禁止
	self.按钮动画:置当前帧 (0)

	self.激活= false
	
	self.按钮文字Y偏移 = 6
	
	self.提示 = false  
	
	self.风格提示= {
			原始内容 = "" ,
			风格文字组 = {},
			宽度 = 0,
			高度 = 0
	}
	

	
	if ( 提示内容 ~= nil ) then 

		self.提示 = true
		self.风格提示.原始内容 = 提示内容
		self.风格提示.风格文字组, self.风格提示.宽度 , self.风格提示.高度 = 格式化文字 (文字,self.风格提示.原始内容,5) 
	
	end 
	
	
	self.按钮文字 = ""
	

end





---=============================================================================--
-- ■ 置按钮文本()
--=============================================================================--

function 类_三层序列图按钮:置按钮文本(标题)
	self.按钮文字 = 标题

end



---=============================================================================--
-- ■ 更新()
--=============================================================================--

function 类_三层序列图按钮:更新(坐标x,坐标y)
	

	self.是否单击 = false


	if (self.禁用 == false ) then 
	
		if(self.按钮动画:取包围盒():检测_点(坐标x,坐标y)) then
		
			if(引擎:取按键按下(键_鼠标左))then 
				self.激活 = true
			end 
		
		
			if(引擎:取按键事件(键_鼠标左)) then
				self.状态 = 3
			else
				self.状态 = 2
			end
			
			if(引擎:取按键弹起(键_鼠标左)) then
				self.是否单击 = true
			end
			
		else
		  
			self.状态 = 1
			self.激活 = false
			
		end
	
	
		if(self.按钮动画:取包围盒():检测_点(坐标x,坐标y) == false) then
			self.状态 = 1
		end
	
	
		if(self.状态 == 1) then
			self.按钮动画:置当前帧 (0)
		end
	
		if(self.状态 == 2) then
			self.按钮动画:置当前帧 (1)
		end
	
	
		if(self.状态 == 3 ) then
			self.按钮动画:置当前帧 (2)
		end
		
		
		
		
		if(self.状态 == 2 or self.状态 == 3) then
		
			if ( self.提示 ) then 
		
				Q_屏幕.最顶气泡显示 = true
				Q_屏幕.风格提示.类型 = 1
				Q_屏幕.风格提示.透明度 = 220
				Q_屏幕.风格提示.风格文字组 = self.风格提示.风格文字组
				Q_屏幕.风格提示.宽度 = self.风格提示.宽度
				Q_屏幕.风格提示.高度 = self.风格提示.高度
				Q_屏幕.风格提示.x = self.显示坐标.x + self.显示偏移.x 
				Q_屏幕.风格提示.y = self.显示坐标.y + self.显示偏移.y
			
			end
				
		end 

	
	else 
	
		self.按钮动画:置当前帧 (2)
	end 




end




---=============================================================================--
-- ■ 显示()
--=============================================================================--

function 类_三层序列图按钮:显示()

	self.按钮动画:显示(self.显示坐标.x, self.显示坐标.y,0,1,1)
	
	if (self.按钮文字 ~= "") then 
		if (self.禁用) then -- 禁止
			文字_描边显示(文字,math.ceil(self.显示坐标.x +(self.单帧宽度-文字:取宽度(self.按钮文字))/2), self.显示坐标.y+self.按钮文字Y偏移 ,self.按钮文字,颜色_灰,颜色_黑)
		else
			if(self.状态 == 2) then
				文字_描边显示(文字,math.ceil(self.显示坐标.x +(self.单帧宽度-文字:取宽度(self.按钮文字))/2), self.显示坐标.y+self.按钮文字Y偏移 ,self.按钮文字,-196659,颜色_黑)
			elseif(self.状态 == 3) then
				文字_描边显示(文字,math.ceil(self.显示坐标.x +(self.单帧宽度-文字:取宽度(self.按钮文字))/2), self.显示坐标.y+self.按钮文字Y偏移 + 1,self.按钮文字,-196659,颜色_黑)
			else
				文字_描边显示(文字,math.ceil(self.显示坐标.x +(self.单帧宽度-文字:取宽度(self.按钮文字))/2), self.显示坐标.y+self.按钮文字Y偏移 ,self.按钮文字,-2243187,颜色_黑)
			end
			
		end
		
	end 
	
	
	

	


end


--=============================================================================--
-- ■ 置状态()     1正常, 2鼠标在上, 3鼠标点击
--=============================================================================--

function 类_三层序列图按钮:置状态(状态)

	self.状态 = 状态

end




--=============================================================================--
-- ■ 是否有焦点()    在:返回真 不在:返回假
--=============================================================================--

function 类_三层序列图按钮:是否有焦点()

	if(self.状态 == 2 or self.状态 == 3) then
		return true
      else
		return false
	end

end






--=============================================================================--
-- ■ 取是否单击()   
--=============================================================================--

function 类_三层序列图按钮:取是否单击()

	if (self.是否单击 and self.激活) then 
		self.激活 = false
		return true 
	end 
	
	
	return false
	

end

--=============================================================================--
-- ■ 移动()   
--=============================================================================--

function 类_三层序列图按钮:移动(x偏移,y偏移)

	self.显示坐标.x =  self.显示坐标.x + x偏移
        self.显示坐标.y =  self.显示坐标.y + y偏移
end


--=============================================================================--
-- ■ 置位置()   
--=============================================================================--

function 类_三层序列图按钮:置位置(x坐标,y坐标)

	self.显示坐标.x =  x坐标
        self.显示坐标.y =  y坐标
end



--=============================================================================--
-- ■ 销毁()   
--=============================================================================--

function 类_三层序列图按钮:销毁()

     引擎:销毁图片(self.图片)
     
     self.按钮动画:销毁()

end








