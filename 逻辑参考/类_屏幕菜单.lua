--==============================================================================--
--╭━━╮┏━━╮╭━━╮╭━━╮╭╭╮╮╭━━╮　╭╭╮╮╭━━╮╭╮╭╮╭━━╮
--┃╭━╯┃╭╮┃┃╭━╯┃╭╮┃┃　　┃┃╭━╯　┃　　┃┃╭╮┃┃╰╯┃┃╭━╯
--┃╰━╮┃┃┃┃┃┃╭╮┃╰╯┃┃┃┃┃┃╰━╮　┃┃┃┃┃╰╯┃┃　╭╯┃╰━╮
--┃╭━╯┃┃┃┃┃┃┃┃┃╭╮┃┃╭╮┃┃╭━╯　┃╭╮┃┃╭╮┃┃　╰╮┃╭━╯
--┃╰━╮┃╰╯┃┃╰╯┃┃┃┃┃┃┃┃┃┃╰━╮　┃┃┃┃┃┃┃┃┃╭╮┃┃╰━╮
--╰━━╯┗━━╯╰━━╯╰╯╰╯╰╯╰╯╰━━╯  ╰╯╰╯╰╯╰╯╰╯╰╯╰━━╯
--
-- 作者:  创建:2010年8月25日9时36分37秒
--=============================================================================--

屏幕菜单  = class()



--=============================================================================--
-- ■ 构造函数
--=============================================================================--
function 屏幕菜单:初始化()

	self.标题背景精灵 = D2D_精灵.创建(0,0,0,100,21)
	self.标题头像精灵 = D2D_精灵.创建(0,0,0,18,18)
	self.标题背景精灵:置颜色(-16250872)
	self.坐标 = {x=0,y=0}
	self.是否显示 = false 
	
	self.名称= ""
	
	self.菜单信息组 = {}
	self.焦点 = false 
	self.脚本表 = {}
	
	self.包围盒 = D2D_包围盒.创建(0,0,10,10)
	
	
end





--=============================================================================--
-- ■ 更新
--=============================================================================--
function 屏幕菜单:更新()

--Q_菜单.焦点 = false 

	
	if ( self.是否显示 ) then 
	
		self.焦点 = false 
		
		self.包围盒:置位置(self.坐标.x + Q_游戏数据.画面偏移.x,self.坐标.y +  Q_游戏数据.画面偏移.y)
		
		if ( self.包围盒:检测_点(Q_游戏数据.鼠标坐标.x  ,Q_游戏数据.鼠标坐标.y ))then 
			Q_游戏鼠标.模式 = "普通"
			
			
			
			self.焦点 = true 
		end 
		
		
		
		for n=1,#self.菜单信息组  do  
			self.菜单信息组[n].按钮:更新(Q_游戏数据.鼠标坐标.x,Q_游戏数据.鼠标坐标.y)
			
			if ( self.菜单信息组[n].按钮:取是否单击() ) then 
				Q_游戏数据.音效组.NPC对话菜单选中:播放()
				if(self.菜单信息组[n].跳转链接 == "exit") then
					self:关闭()
					break
				else
					
					if (self.脚本表[self.菜单信息组[n].跳转链接] ~= nil) then
						self.脚本表[self.菜单信息组[n].跳转链接]()
						self:关闭()
						break
					end
					
--					if (self.菜单信息组[n].跳转链接 ~= nil) then
--						执行脚本函数(self.菜单信息组[n].跳转链接)
--						self:关闭()
--						break
--					end
--	
				end
				
			end 
			
			
		
		end 
	

		
	end 

end



--=============================================================================--
-- ■ 打开到
--=============================================================================--
function 屏幕菜单:打开(NPC标识,脚本表,...)

	self:销毁()

	self.坐标.x = Q_游戏数据.鼠标坐标.x+5 -  Q_游戏数据.画面偏移.x
	self.坐标.y = Q_游戏数据.鼠标坐标.y-  Q_游戏数据.画面偏移.y
	
	self.包围盒:置位置(self.坐标.x + Q_游戏数据.画面偏移.x ,self.坐标.y + Q_游戏数据.画面偏移.y)
	
	self.是否显示 = true 
	self.名称 = "nil"
	self.脚本表 = 脚本表
	
	local 本次NPC对象 = Q_游戏数据.游戏NPC组[NPC标识]
	
	
	if (本次NPC对象 ~= nil ) then 
		
		self.名称 = 本次NPC对象.名称
		
		if (本次NPC对象.菜单头像 ~= "") then
			self.标题头像精灵:置图片(本次NPC对象.菜单头像图片)
		end
		
	end 
	
	
	
	local  项目个数 = table.getn(arg)
	local  分割文本T = {}
 

	for n=1, 项目个数 do
	
		分割文本T = 分割文本 (arg[n],"@")
		
		Q_菜单.菜单信息组[n] =
		{
			
			
			按钮 = 类_三层序列图按钮.创建("dat/ui/菜单_" .. 分割文本T[1] .. ".png", self.坐标.x,self.坐标.y + n*21+4,true) ,
			跳转链接 = 分割文本T[2]
		}
	
	end

	
	self.包围盒:置宽高(100,项目个数* 20 + 22)
	Q_游戏数据.音效组.NPC对话菜单打开:播放()
	
end



--=============================================================================--
-- ■ 关闭
--=============================================================================--
function 屏幕菜单:关闭()
	
	self.是否显示 = false 
	self.焦点 = false
	self:销毁()
	
	
end 





--=============================================================================--
-- ■ 显示
--=============================================================================--
function 屏幕菜单:显示()

	if ( self.是否显示 ) then 
		
		self.标题背景精灵:显示(self.坐标.x + Q_游戏数据.画面偏移.x,self.坐标.y + Q_游戏数据.画面偏移.y)
		self.标题头像精灵:显示(self.坐标.x + Q_游戏数据.画面偏移.x,self.坐标.y + Q_游戏数据.画面偏移.y+2)
		
		文字_描边显示(文字,self.坐标.x +18+ Q_游戏数据.画面偏移.x +math.abs(82 - 文字:取宽度(self.名称))/2   ,self.坐标.y + 5 ,self.名称,颜色_白,颜色_黑)
		

		for n=1,table.getn(self.菜单信息组) do  
			self.菜单信息组[n].按钮:置位置(self.坐标.x + Q_游戏数据.画面偏移.x,self.坐标.y + n*21+ Q_游戏数据.画面偏移.y)
			self.菜单信息组[n].按钮:显示()
		end 
	

		if (Q_调试) then 
			self.包围盒:显示()
		end 
		
	end 



end


--=============================================================================--
-- ■ 销毁
--=============================================================================--
function 屏幕菜单:销毁()

	for n=1,table.getn(self.菜单信息组) do  
		self.菜单信息组[n].按钮:销毁()
	end 
	
	self.菜单信息组 = nil 
	self.菜单信息组 = {}



end 



