--==============================================================================--
--╭━━╮┏━━╮╭━━╮╭━━╮╭╭╮╮╭━━╮　╭╭╮╮╭━━╮╭╮╭╮╭━━╮
--┃╭━╯┃╭╮┃┃╭━╯┃╭╮┃┃　　┃┃╭━╯　┃　　┃┃╭╮┃┃╰╯┃┃╭━╯
--┃╰━╮┃┃┃┃┃┃╭╮┃╰╯┃┃┃┃┃┃╰━╮　┃┃┃┃┃╰╯┃┃　╭╯┃╰━╮
--┃╭━╯┃┃┃┃┃┃┃┃┃╭╮┃┃╭╮┃┃╭━╯　┃╭╮┃┃╭╮┃┃　╰╮┃╭━╯
--┃╰━╮┃╰╯┃┃╰╯┃┃┃┃┃┃┃┃┃┃╰━╮　┃┃┃┃┃┃┃┃┃╭╮┃┃╰━╮
--╰━━╯┗━━╯╰━━╯╰╯╰╯╰╯╰╯╰━━╯  ╰╯╰╯╰╯╰╯╰╯╰╯╰━━╯
--
-- 作者:  创建:2011年4月13日23时6分22秒
--=============================================================================--

类_GUI_标签  = class()



--=============================================================================--
-- ■ 构造函数
--=============================================================================--
function 类_GUI_标签:初始化(宽度,高度,标签颜色)
	
	
	self.标签渲染区 = 引擎:创建渲染区(宽度,高度,true)
	self.标签渲染精灵 = D2D_精灵.创建(引擎:取渲染区纹理(self.标签渲染区),0,0,宽度,高度)
	
	self.标题 = ""
	self.渲染结束 = true
	self.标签宽度 = 宽度
	self.标签高度 = 高度
	
	self.标签颜色 = 标签颜色 == nil and 0 or 标签颜色 
	
	self.文字颜色 = 颜色_白
	self.描边颜色 = 颜色_黑
	self.显示类型 = 1
	
	self.风格框 = true
	

	
	
end





--=============================================================================--
-- ■ 更新
--=============================================================================--
function 类_GUI_标签:更新()


	if (not self.渲染结束) then
		
		
		if (self.风格框) then
		
			渲染开始(self.标签渲染区)
			清屏()
			
			-- 标签上的渲染实体
			
			显示风格框(0,0,文字:取宽度(self.标题),文字:取高度(self.标题),200,2) 
			
			
			
			if (self.显示类型 == 1) then -- 左对齐
				
				文字:显示_描边(0,0,self.标题 ,self.文字颜色,self.描边颜色)	
				
			elseif (self.显示类型 == 2) then -- 居中对齐
				
				文字:显示_描边(取整_((self.标签宽度-文字:取宽度(self.标题))/2),取整_((self.标签高度-文字:取高度(self.标题))/2),self.标题 ,self.文字颜色,self.描边颜色)	
				self.标签渲染精灵:置中心点( 取整_(self.标签宽度/2), 0)
				
				
			elseif (self.显示类型 == 3) then -- 右对齐
				
				文字:显示_描边(取整_(self.标签宽度-文字:取宽度(self.标题)),0,self.标题 ,self.文字颜色,self.描边颜色)
				
			end
--			
			
			渲染结束()

		
		
		else
			
			渲染开始(self.标签渲染区)
			清屏(self.标签颜色)
			
			-- 标签上的渲染实体
			
			if (self.显示类型 == 1) then -- 左对齐
				
				文字:显示_描边(0,0,self.标题 ,self.文字颜色,self.描边颜色)	
				
			elseif (self.显示类型 == 2) then -- 居中对齐
				
				文字:显示_描边(取整_((self.标签宽度-文字:取宽度(self.标题))/2),取整_((self.标签高度-文字:取高度(self.标题))/2),self.标题 ,self.文字颜色,self.描边颜色)	
				self.标签渲染精灵:置中心点( 取整_(self.标签宽度/2), 0)
				
				
			elseif (self.显示类型 == 3) then -- 右对齐
				
				文字:显示_描边(取整_(self.标签宽度-文字:取宽度(self.标题)),0,self.标题 ,self.文字颜色,self.描边颜色)
				
			end
			
			
			渲染结束()

			
		end
		
		
		self.渲染结束 = true
	end
	


end


--=============================================================================--
-- ■ 显示
--=============================================================================--
function 类_GUI_标签:显示(x,y)

	
	self.标签渲染精灵:显示(x,y)
	
--显示边框	
	if (Q_调试) then
		self.标签渲染精灵:取包围盒():显示()
	end
	
	
end





--=============================================================================--
-- ■ 置标题
--=============================================================================--
function 类_GUI_标签:置标题(标题,显示类型,文字颜色,描边颜色)   -- 显示类型 1:左对齐  2:居中  3:右对齐
	
	if (标题 == self.标题) then  -- 相同则不更新
		return 
	end
	
	
	self.标题 = 标题
	self.渲染结束 = false
	
	self.显示类型 = 显示类型
	self.文字颜色 = 文字颜色 == nil and 颜色_白 or 文字颜色 
	self.描边颜色 = 描边颜色 == nil and 颜色_黑 or 描边颜色 
	
	
	
	
	
end




--=============================================================================--
-- ■ 销毁
--=============================================================================--
function 类_GUI_标签:销毁()
	
	self.标签渲染精灵:销毁()
	引擎:销毁渲染区(self.标签渲染区)
	
end



