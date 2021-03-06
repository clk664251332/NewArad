--==============================================================================--
--╭━━╮┏━━╮╭━━╮╭━━╮╭╭╮╮╭━━╮　╭╭╮╮╭━━╮╭╮╭╮╭━━╮
--┃╭━╯┃╭╮┃┃╭━╯┃╭╮┃┃　　┃┃╭━╯　┃　　┃┃╭╮┃┃╰╯┃┃╭━╯
--┃╰━╮┃┃┃┃┃┃╭╮┃╰╯┃┃┃┃┃┃╰━╮　┃┃┃┃┃╰╯┃┃　╭╯┃╰━╮
--┃╭━╯┃┃┃┃┃┃┃┃┃╭╮┃┃╭╮┃┃╭━╯　┃╭╮┃┃╭╮┃┃　╰╮┃╭━╯
--┃╰━╮┃╰╯┃┃╰╯┃┃┃┃┃┃┃┃┃┃╰━╮　┃┃┃┃┃┃┃┃┃╭╮┃┃╰━╮
--╰━━╯┗━━╯╰━━╯╰╯╰╯╰╯╰╯╰━━╯  ╰╯╰╯╰╯╰╯╰╯╰╯╰━━╯
--
-- 作者:  创建:2010年10月16日15时26分2秒
--=============================================================================--

类_窗口_道具商店  = class()



--=============================================================================--
-- ■ 构造函数
--=============================================================================--
function 类_窗口_道具商店:初始化(x坐标,y坐标)
	
	self.标识 = "商店窗口"
	self.可视 = false
	self.移动  = true
	self.可移动 = true
	self.事件激活 = false
	self.坐标 = {x=x坐标,y=y坐标}
	self.焦点 = false
	self.临时点= { x=0 , y=0 }
	self.最后激活时间 = 0
	
	
	
	
	self.面板图片 = 引擎:载入图片("Dat/UI/商店窗口.png")
	self.面板精灵 = D2D_精灵.创建(self.面板图片,0,0,引擎:取图片宽度(self.面板图片),引擎:取图片高度(self.面板图片))
	
	
	self.触发移动包围盒 = D2D_包围盒.创建(x坐标,y坐标,290,40)
	
	self.滑动条_上按钮 = 类_三层序列图按钮.创建("Dat/ui/滑动条_上按钮.png", self.坐标.x + 252,self.坐标.y+158,false)
	self.滑动条_下按钮 = 类_三层序列图按钮.创建("Dat/ui/滑动条_下按钮.png", self.坐标.x + 252,self.坐标.y+303,false)
	self.关闭按钮 = 类_三层序列图按钮.创建("Dat/ui/面板关闭按钮.png", self.坐标.x  + 261,self.坐标.y+12,false)
	
	
	self.GUI布局 = D2D_GUI布局.创建()
	self.滑动条图片  = 引擎:载入图片 ("Dat/ui/滑动条_滑块.png")
	self.滑动条 = D2D_滑动条.创建(1,self.坐标.x + 249,self.坐标.y+182,18,112,self.滑动条图片,0,0,11,16,true)
	self.滑动条:置属性(0,100 ,2)
	self.滑动条:置位置(0)
	
	
	self.GUI布局:绑定控件(self.滑动条.p)






	self.商店窗口头像精灵 = D2D_精灵.创建(0,0,0,0,0)

	self.提示信息 =  ""
	self.商店格子 = {}
	self.行数 = 0
	self.物品总数 = 0
	
	self.本次显示起始 = 0 
	self.本次显示结束 = 0
	
	
end





--=============================================================================--
-- ■ 更新
--=============================================================================--
function 类_窗口_道具商店:更新()

	if(self.可视 ) then
		
		if (Q_屏幕.鼠标窗口全id ~= 0 and Q_屏幕.界面_窗口_数组[Q_屏幕.鼠标窗口全id].标识 == "商店窗口" ) then
			self.焦点 = true
		else 
			self.焦点 = false 
		end
		
		self.滑动条_上按钮:更新(Q_游戏数据.鼠标坐标.x,Q_游戏数据.鼠标坐标.y)
		self.滑动条_下按钮:更新(Q_游戏数据.鼠标坐标.x,Q_游戏数据.鼠标坐标.y)
		self.关闭按钮:更新(Q_游戏数据.鼠标坐标.x,Q_游戏数据.鼠标坐标.y)
		self.GUI布局:更新(dt)
		
		if ( self.焦点) then 
			if(self.关闭按钮:取是否单击())then
				self:开关()
			end
			
			for n= self.本次显示起始  ,self.本次显示结束   do 
				self.商店格子[n]:更新( )
			end 
		end 
		
		
		
		if (self.物品总数 <=35) then 
			self.GUI布局:隐藏控件(1,true)
		else 
			self.GUI布局:隐藏控件(1,false)
		end 
		
	
	
--		if ( self.焦点) then 
--			self.关闭按钮:更新(Q_鼠标坐标.x,Q_鼠标坐标.y)
--		end 
--		
--		if(self.关闭按钮:取是否单击())then
--			self:开关()
--		end
--		

		
		
	end 
	

end





--=============================================================================--
-- ■ 显示
--=============================================================================--
function 类_窗口_道具商店:显示()


	if(self.可视 ) then
		
		self.面板精灵:显示(self.坐标.x,self.坐标.y)
		
		self.商店窗口头像精灵:显示(self.坐标.x+27,self.坐标.y+50)
		文字_描边显示(文字,self.坐标.x+110,self.坐标.y+58,self.提示信息 ,-726822,-16777216)
		
		self.滑动条_上按钮:显示()
		self.滑动条_下按钮:显示()
		self.关闭按钮:显示()
		self.GUI布局:显示()
		
		if ( 引擎:取滚轮事件() >0 ) then  -- 如果鼠标滚轮滚动 改变滑动条位置
			self.滑动条:置位置 (self.滑动条:取位置 () - 100 / (self.行数 - 5))
		end 
	
		if ( 引擎:取滚轮事件() <0 ) then 
			self.滑动条:置位置 (self.滑动条:取位置 () + 100 / (self.行数 - 5))
		end 

		t = 取整 (self.滑动条:取位置 () / (100 / (self.行数+1 - 5))) -- 更加滑动条位置 再得出当前应该显示哪一行
		
		if ( t  <= 0 ) then 
			t   = 1
		end 
		
		
		self.本次显示起始 = t * 7 -6
		self.本次显示结束 = self.本次显示起始 + 5 * 7 -1
		
		
		
		
		if (self.本次显示结束 > self.物品总数) then 
			self.本次显示结束 = self.物品总数
		end 
		
		
		for n= self.本次显示起始  ,self.本次显示结束   do 
			self.商店格子[n]:显示(- (t-1) *32 )
		end 
		
		
		
		
		
		if (Q_调试) then 
			self.触发移动包围盒:显示()
		end 
		
	end 
	
	
	


end




--=============================================================================--
-- ■ 显示商店装备属性
--=============================================================================--

function 类_窗口_道具商店:显示商店装备属性()
	
	if (self.焦点==false) then 
		return 
	end 
		--- self.焦点
	local 显示偏移 = 0
	local 显示偏移Y = 0
	

	for n= self.本次显示起始  ,self.本次显示结束   do 
	
		if (self.商店格子[n].道具标识 ~= 0 and self.商店格子[n].包围盒:检测_点(Q_游戏数据.鼠标坐标.x, Q_游戏数据.鼠标坐标.y) and Q_屏幕.信息框.焦点 == false) then
			
			if (Q_游戏数据.鼠标坐标.x < Q_游戏数据.屏幕宽度 / 2) then 
				显示偏移 = 30
			else 
				显示偏移 = - self.商店格子[n].风格提示.宽度 - 20
			end 
			
			显示偏移Y = self.商店格子[n].y-self.商店格子[n].风格提示.高度/2 
			
		
			显示风格提示(self.商店格子[n].x + 显示偏移,显示偏移Y,
							self.商店格子[n].风格提示.风格文字组, 
							self.商店格子[n].风格提示.宽度, 
							self.商店格子[n].风格提示.高度,220,1,2,1,self.商店格子[n].道具) 
			
--			if (self.商店格子[n].道具.分类 == "手镯") then 
--				self:对比显示属性(n,显示偏移,显示偏移Y,7)
--			elseif (self.商店格子[n].道具.分类 == "项链") then 
--				self:对比显示属性(n,显示偏移,显示偏移Y,5)
--			elseif (self.商店格子[n].道具.分类 == "戒指") then 
--				self:对比显示属性(n,显示偏移,显示偏移Y,8)
--			elseif (self.商店格子[n].道具.分类 == "武器") then 
--				self:对比显示属性(n,显示偏移,显示偏移Y,2)
--			elseif (self.商店格子[n].道具.分类 == "衣服") then 
--				self:对比显示属性(n,显示偏移,显示偏移Y,1)
--			elseif (self.商店格子[n].道具.分类 == "腰带") then 
--				self:对比显示属性(n,显示偏移,显示偏移Y,3)
--			elseif (self.商店格子[n].道具.分类 == "鞋子") then 
--				self:对比显示属性(n,显示偏移,显示偏移Y,4)
--			elseif (self.商店格子[n].道具.分类 == "副手") then 
--				self:对比显示属性(n,显示偏移,显示偏移Y,6)
--			end 
			
			
			
			return 
		end
		
	end

	
end 






--=============================================================================--
-- ■ 销毁商店物品
--=============================================================================--

function 类_窗口_道具商店:销毁商店物品()
	
	for n=1,#self.商店格子 do
		if ( self.商店格子[n].道具标识 ~= 0) then 
			self.商店格子[n]:销毁()
		end
	end
	
	self.商店格子 = nil
	self.商店格子 = {}
--	collectgarbage("collect")  -- 垃圾回收

end





--=============================================================================--
-- ■ 开始移动()
--=============================================================================--

function 类_窗口_道具商店:开始移动()

	if (self.可视 and self.焦点 and self.可移动) then
		self.坐标.x =  Q_游戏数据.鼠标坐标.x - self.临时点.x
		self.坐标.y =  Q_游戏数据.鼠标坐标.y - self.临时点.y
		self.触发移动包围盒:置位置(self.坐标.x,self.坐标.y)
		
		self.滑动条_上按钮:置位置(self.坐标.x + 252,self.坐标.y+158)
		self.滑动条_下按钮:置位置(self.坐标.x + 252,self.坐标.y+303)
		self.关闭按钮:置位置(self.坐标.x + 261,self.坐标.y+12)
		self.GUI布局:移动控件(1,self.坐标.x + 249,self.坐标.y+182)
		
		
		
		local n = 0
	
		for i=1,self.行数 do
			for j=1,7 do
				n = n + 1
				
				self.商店格子[n]:置位置(j * 32 + self.坐标.x -4,i * 32 +self.坐标.y+128)
				
			end
		end
		
		
		
		
		
	end


end




--=============================================================================--
-- ■ 置焦点()
--=============================================================================--

function 类_窗口_道具商店:置焦点(是否焦点)
	self.焦点 = 是否焦点
end



--=============================================================================--
-- ■ 移动()
--=============================================================================--

function 类_窗口_道具商店:初始移动()

	self.最后激活时间 = 引擎:取运行时间()

	if (self.事件激活 == false ) then
		Q_屏幕.移动焦点窗口 = true
	end


	if (self.可视 and self.焦点 and self.可移动) then
		self.临时点.x = Q_游戏数据.鼠标坐标.x - self.坐标.x
		self.临时点.y = Q_游戏数据.鼠标坐标.y - self.坐标.y
	end

end






--=============================================================================--
-- ■ 初始化
--=============================================================================--

function 类_窗口_道具商店:重置(行数)

	self.商店格子 = nil 
	self.商店格子 = {}
	self.行数 = 行数

	local n = 0

	for i=1,self.行数 do
		for j=1,7 do
			n = n + 1
			self.商店格子[n] = 格子_包裹格子.创建(j * 32 + self.坐标.x -4,i * 32 +self.坐标.y+128 ,28,28,1000+n,"商店")
		end
	end
	
	
	

	self.物品总数 = table.getn(self.商店格子)
	
	
	self.本次显示起始 = 1
	self.本次显示结束 = 40
	
	

end 



--=============================================================================--
-- ■ 打开()
--=============================================================================--

function 类_窗口_道具商店:打开(x,y)
	self.可视 = true
	self.最后激活时间 = 引擎:取运行时间()
	self.焦点 = true
	
	self.坐标.x = x
	self.坐标.y = y

	self.触发移动包围盒:置位置(self.坐标.x,self.坐标.y)
	
	self.滑动条_上按钮:置位置(self.坐标.x + 252,self.坐标.y+158)
	self.滑动条_下按钮:置位置(self.坐标.x + 252,self.坐标.y+303)
	self.关闭按钮:置位置(self.坐标.x + 261,self.坐标.y+12)
	self.GUI布局:移动控件(1,self.坐标.x + 249,self.坐标.y+182)
	
	
	
	local n = 0

	for i=1,self.行数 do
		for j=1,7 do
			n = n + 1
			
			self.商店格子[n]:置位置(j * 32 + self.坐标.x -4,i * 32 +self.坐标.y+128)
			
		end
	end
	
	
	Q_游戏数据.音效组.窗口打开:播放()



end

--=============================================================================--
-- ■ 开关()
--=============================================================================--

function 类_窗口_道具商店:开关()


	
	if(self.可视) then
		self.可视 = false
		self.焦点 = false 
		Q_游戏数据.音效组.窗口关闭:播放()
	else
		self.可视 = true
		self.最后激活时间 = 引擎:取运行时间()
		self.焦点 = true
		Q_游戏数据.音效组.窗口打开:播放()
	end

	
	
end




--=============================================================================--
-- ■ 检测点()
--=============================================================================--

function 类_窗口_道具商店:检测点()

	if (self.事件激活) then
		self.可移动 = false
	else
		self.可移动 = true
	end

	
	if (self.可视 and self.关闭按钮:是否有焦点() == false  ) then
		if (self.触发移动包围盒:检测_点(Q_游戏数据.鼠标坐标.x,Q_游戏数据.鼠标坐标.y)) then 
			return true
		end 
	end

	return false

end


--=============================================================================--
-- ■ 检测点_全局()
--=============================================================================--

function 类_窗口_道具商店:检测点_全局()
		
	if (self.面板精灵:取包围盒():检测_点(Q_游戏数据.鼠标坐标.x,Q_游戏数据.鼠标坐标.y) or 
	     self.触发移动包围盒:检测_点(Q_游戏数据.鼠标坐标.x,Q_游戏数据.鼠标坐标.y)
	     
		) then 
		return  true 
	end 
	
	return false
		
end 








