--==============================================================================--
--╭━━╮┏━━╮╭━━╮╭━━╮╭╭╮╮╭━━╮　╭╭╮╮╭━━╮╭╮╭╮╭━━╮
--┃╭━╯┃╭╮┃┃╭━╯┃╭╮┃┃　　┃┃╭━╯　┃　　┃┃╭╮┃┃╰╯┃┃╭━╯
--┃╰━╮┃┃┃┃┃┃╭╮┃╰╯┃┃┃┃┃┃╰━╮　┃┃┃┃┃╰╯┃┃　╭╯┃╰━╮
--┃╭━╯┃┃┃┃┃┃┃┃┃╭╮┃┃╭╮┃┃╭━╯　┃╭╮┃┃╭╮┃┃　╰╮┃╭━╯
--┃╰━╮┃╰╯┃┃╰╯┃┃┃┃┃┃┃┃┃┃╰━╮　┃┃┃┃┃┃┃┃┃╭╮┃┃╰━╮
--╰━━╯┗━━╯╰━━╯╰╯╰╯╰╯╰╯╰━━╯  ╰╯╰╯╰╯╰╯╰╯╰╯╰━━╯
--
-- 作者:  创建:2010年9月13日22时11分35秒
--=============================================================================--

信息提示框  = class()



--=============================================================================--
-- ■ 构造函数
--=============================================================================--
function 信息提示框:初始化()
	

	self.提示内容 =  "出售[紫藤长靴]\n" .. 按行格式化文本("总出售价格为706564,确定要出售吗？",文字,10)
	
	self.可视 = false  
	self.类型 = "确认"
	
	
	self.坐标 = {x=252,y=200}
	
	
	self.焦点 = false
	

	
	self.确认按钮 = 类_三层序列图按钮.创建("dat/ui/确认按钮.png", self.坐标.x+17, self.坐标.y + 文字:取高度(self.提示内容 ) + 20,false)
	self.取消按钮 = 类_三层序列图按钮.创建("dat/ui/取消按钮.png", self.坐标.x+80, self.坐标.y + 文字:取高度(self.提示内容 ) + 20,false)
	
	self.总宽度 = 135
	self.总高度 =  文字:取高度(self.提示内容 ) + 40
	
	
	
	self.装备背景精灵 = D2D_精灵.创建(0,0,0,180,30)
	self.装备背景精灵:置颜色(ARGB(50,255,255,255))
	
	
	self.数量输入框背景图片 = 引擎:载入图片("Dat/ui/数量选择.png")
	self.数量输入框背景精灵 = D2D_精灵.创建(self.数量输入框背景图片,0,0,164,72) 
	
	
	
	
	self.数量增十按钮 = 类_三层序列图按钮.创建("dat/ui/数量增十按钮.png", self.坐标.x, self.坐标.y ,false)
	self.数量减十按钮 = 类_三层序列图按钮.创建("dat/ui/数量减十按钮.png", self.坐标.x, self.坐标.y, false)
	
	
	self.数量增一按钮 = 类_三层序列图按钮.创建("dat/ui/数量输入_上箭头.png", self.坐标.x, self.坐标.y ,false)
	self.数量减一按钮 = 类_三层序列图按钮.创建("dat/ui/数量输入_下箭头.png", self.坐标.x, self.坐标.y ,false)
	
	
	self.包围盒 = D2D_包围盒.创建(self.坐标.x,self.坐标.y,self.总宽度+16,self.总高度+16)
	
	self.数量输入框 = D2D_输入框.创建(75,-7253,"宋体",12,false,false,false,4,false )
	self.数量输入框:数字模式(true)


--	

--	self.袖珍罐_背景图片 = 引擎:载入图片("dat/ui/袖珍罐相关/9.png")
--	self.袖珍罐_背景精灵 = D2D_精灵.创建(self.袖珍罐_背景图片,0,0,206,163)

--	self.袖珍罐_爆炸图片A = 引擎:载入图片("dat/ui/袖珍罐相关/7.png")
--	self.袖珍罐_爆炸图片B = 引擎:载入图片("dat/ui/袖珍罐相关/8.png")

--	self.袖珍罐_爆炸精灵A = D2D_精灵.创建(self.袖珍罐_爆炸图片A,0,0,152,95)
--	self.袖珍罐_爆炸精灵B = D2D_精灵.创建(self.袖珍罐_爆炸图片B,0,0,196,114)



--	self.袖珍罐_罐子背景图片 = 引擎:载入图片("dat/ui/袖珍罐相关/4.png")
--	self.袖珍罐_罐子背景精灵 = D2D_精灵.创建(self.袖珍罐_罐子背景图片,0,0,100,106)

--	self.袖珍罐_罐子图片 = 引擎:载入图片("dat/ui/袖珍罐相关/0.png")
--	self.袖珍罐_罐子破碎图片A = 引擎:载入图片("dat/ui/袖珍罐相关/1.png")
--	self.袖珍罐_罐子破碎图片B = 引擎:载入图片("dat/ui/袖珍罐相关/2.png")

--	self.袖珍罐_罐子精灵 = D2D_精灵.创建(self.袖珍罐_罐子图片,0,0,100,106)
--	self.袖珍罐_罐子精灵:置中心点(50,53)
--	self.袖珍罐_罐子背景精灵:置中心点(50,53)

--	self.袖珍罐_碎片图片A = 引擎:载入图片("dat/ui/袖珍罐相关/5.png")
--	self.袖珍罐_碎片图片B = 引擎:载入图片("dat/ui/袖珍罐相关/6.png")
--	self.袖珍罐_碎片图片C = 引擎:载入图片("dat/ui/袖珍罐相关/3.png")

--	self.袖珍罐_碎片精灵A = D2D_精灵.创建(self.袖珍罐_碎片图片A,0,0,160,28)
--	self.袖珍罐_碎片精灵B = D2D_精灵.创建(self.袖珍罐_碎片图片B,0,0,163,31)
--	self.袖珍罐_碎片精灵C = D2D_精灵.创建(self.袖珍罐_碎片图片C,0,0,169,33)


--	self.袖珍罐_遮罩图片 = 引擎:载入图片("dat/ui/袖珍罐相关/10.png")
--	self.袖珍罐_遮罩精灵 = D2D_精灵.创建(self.袖珍罐_遮罩图片,0,0,202,159)

--	self.袖珍罐_进度条背景精灵 = D2D_精灵.创建(0,0,0,160,10)
--	self.袖珍罐_进度条背景精灵:置颜色(颜色_黑)
--	
--	self.袖珍罐_进度条前景精灵 = D2D_精灵.创建(0,0,0,158,8)
--	self.袖珍罐_进度条前景精灵:置颜色(颜色_黄)
--	

--	self.袖珍罐_提示 = "正在开启袖珍罐"
--	self.袖珍罐_罐子弧度 = 0
--	self.袖珍罐_变化间隔 = 0.02
--	self.袖珍罐_变化计次 = 0
--	self.袖珍罐_摇奖时间 = 0


--	self.袖珍罐_爆炸精灵A计次 = 0
--	self.袖珍罐_爆炸精灵B计次 = 0
--	self.袖珍罐_爆炸精灵C计次 = 0

--	self.袖珍罐_通明度 = 0
--	self.袖珍罐_过渡值 = 5
--	self.袖珍罐_闪烁结束 = false 

--	self.袖珍罐_随机道具组 = {}
--	self.袖珍罐_选中ID = 0
--	self.袖珍罐_罐子所在格子 = 0

	
	
end



--=============================================================================--
-- ■ 提示
--=============================================================================--
function 信息提示框:提示(坐标x,坐标y,内容,类型,事件,id,数量)

	if (类型 == "开罐子" and self.袖珍罐_罐子所在格子 ~= 0 ) then 
		return false
	end 
	
	文字:置行距(2)

	Q_游戏数据.音效组.提示框:播放()
	
	local x偏移 = 0
	self.类型 = 类型
	self.提示内容 =  内容
	self.可视 = true 
	self.事件 = 事件

	self.总宽度 = 文字:取宽度(self.提示内容 ) 
	self.总高度 =  文字:取高度(self.提示内容 ) + 40
	
	
	
	if (self.类型 == "确认取消") then 
		
		self.总宽度 = self.总宽度 + 10
		self.坐标.x,self.坐标.y = 坐标x - self.总宽度/2 + 20 ,坐标y - self.总高度+12
		x偏移 = self.坐标.x + self.总宽度 - 620
		if (x偏移 > 0) then 
			坐标x = 坐标x - x偏移
		end 
		self.坐标.x,self.坐标.y = 坐标x - self.总宽度/2 + 20 ,坐标y - self.总高度+12
		self.确认按钮:置位置(坐标x-26,坐标y -8)
		self.取消按钮:置位置(坐标x+30,坐标y -8 )
		
		
		if (self.事件 == "出售道具") then 
			self.道具对象 = id
			self.出售数量 = 数量
			
		elseif (self.事件 == "购买道具") then 
			self.道具对象 = id
			self.购买数量 = 数量
		
		end 
		
		self.坐标.x = math.ceil(self.坐标.x)
		self.坐标.y = math.ceil(self.坐标.y)
		self.包围盒:置宽高(self.总宽度 +13,self.总高度+15 )
	
	elseif (self.类型 == "确认") then 
		self.总宽度 = self.总宽度 + 10
		
		
		
		
		if (坐标x == -1) then 

			self.坐标.x,self.坐标.y = 320 - self.总宽度/2  ,240- self.总高度+12
			
			self.确认按钮:置位置(self.坐标.x + self.总宽度/2 - 16,self.坐标.y + self.总高度 - 18)
			
			
			
			
			
		else 
		
			self.坐标.x,self.坐标.y = 坐标x - self.总宽度/2  ,坐标y - self.总高度+12
			
--			if (self.坐标.x<=2 ) then
--				self.坐标.x=   2
--			end
			
			
			self.确认按钮:置位置(坐标x -20,坐标y-8)
			
			
		end 
		
		
		
		self.坐标.x = math.ceil(self.坐标.x)
		self.坐标.y = math.ceil(self.坐标.y)
		
		self.包围盒:置宽高(self.总宽度 +13,self.总高度+15 )

	elseif (self.类型 == "分解") then 
		self.总宽度 = 190
		self.总高度 = 100
		self.坐标.x,self.坐标.y = 坐标x - 70 ,坐标y - self.总高度+12

		self.确认按钮:置位置(self.坐标.x-21+65,self.坐标.y -10+90)
		self.取消按钮:置位置(self.坐标.x+44+65,self.坐标.y -10+90 )
		
		self.道具格子 = id 
		self.道具对象 = Q_包裹窗口.子夹组[1].格子[id].道具.id

		self.坐标.x = math.ceil(self.坐标.x)
		self.坐标.y = math.ceil(self.坐标.y)
		self.包围盒:置宽高(self.总宽度 +13,self.总高度+15 )
		
	elseif (self.类型 == "分解成功") then 
			
		self.总宽度 = 220
		self.总高度 = 180
		
		self.坐标.x,self.坐标.y = 坐标x - 80 ,坐标y - self.总高度+12
		self.确认按钮:置位置(self.坐标.x+90,self.坐标.y +160)
		self.坐标.x = math.ceil(self.坐标.x)
		self.坐标.y = math.ceil(self.坐标.y)
		self.包围盒:置宽高(self.总宽度 +13,self.总高度+15 )

		
		
	elseif (self.类型 == "数量输入") then 
		
		self.总宽度 = 145
		self.总高度 = 72
		self.坐标.x,self.坐标.y = 坐标x - self.总宽度/2 + 20 ,坐标y - self.总高度
		x偏移 = self.坐标.x + self.总宽度 - 620
		if (x偏移 > 0) then 
			坐标x = 坐标x - x偏移
		end 
		self.坐标.x,self.坐标.y = 坐标x - self.总宽度/2 + 20 ,坐标y - self.总高度+25
		self.确认按钮:置位置(坐标x-24,坐标y -8)
		self.取消按钮:置位置(坐标x+30,坐标y -8 )
		
		self.数量增十按钮:置位置(坐标x+77,坐标y - 39 )
		self.数量减十按钮:置位置(坐标x+77,坐标y - 25 )
		
		self.数量增一按钮:置位置(坐标x+57,坐标y - 37 )
		self.数量减一按钮:置位置(坐标x+57,坐标y - 27 )
		
		self.数量输入框:置焦点()		
		Q_游戏鼠标.模式 = "普通"
		
		self.数量输入框:清空()
		
		
		self.坐标.x = math.ceil(self.坐标.x)
		self.坐标.y = math.ceil(self.坐标.y)

		if (self.事件 == "购买") then 
			self.道具对象 = id	
			self.数量输入框:插入文本("1")
			
		elseif (self.事件 == "出售") then 
			self.道具对象 = id
			
			self.数量输入框:插入文本(tostring(self.道具对象.数量))
			
		end 
		
		self.包围盒:置宽高(164,72)
		
		
		
	elseif (self.类型 == "开罐子") then 
		
		
		self.总宽度 = 235
		self.总高度 = 240
		
		self.坐标.x,self.坐标.y = 坐标x - 80 ,坐标y - self.总高度+12
		self.确认按钮:置位置(self.坐标.x+100,self.坐标.y +220)
		
		self.取消按钮:置位置(self.坐标.x+100,self.坐标.y +220 )
		
		
		self.坐标.x = math.ceil(self.坐标.x)
		self.坐标.y = math.ceil(self.坐标.y)
		self.包围盒:置宽高(self.总宽度 +13,self.总高度+15 )
		
		
		self.袖珍罐_罐子弧度 = 0
		self.袖珍罐_变化间隔 = 0.02
		self.袖珍罐_变化计次 = 0
		self.袖珍罐_摇奖时间 = 0
	
	
		self.袖珍罐_爆炸精灵A计次 = 0
		self.袖珍罐_爆炸精灵B计次 = 0
		self.袖珍罐_爆炸精灵C计次 = 0
	
		self.袖珍罐_通明度 = 0
		self.袖珍罐_过渡值 = 5
		self.袖珍罐_闪烁结束 = false 
		
		self.袖珍罐_罐子精灵:置图片(self.袖珍罐_罐子图片)

		self.袖珍罐_提示 = "正在开启袖珍罐"
		
		self.袖珍罐_随机道具组 = 事件
		self.袖珍罐_罐子名称 = Q_游戏道具组[Q_最后使用道具格子.道具.id ].名称
		self.袖珍罐_罐子所在格子 = Q_最后使用道具格子.标识 
		self.袖珍罐_罐子格子 = Q_最后使用道具格子
		Q_全局音效.开罐子音效:播放()
		
	
		
	end 
	


	
	self.包围盒:置位置(self.坐标.x,self.坐标.y)
	
	

	self.激活 = false
	
	
	return true 
	

	
end 


--=============================================================================--
-- ■ 更新
--=============================================================================--
function 信息提示框:更新()


	if (self.可视) then 

		if (self.类型 == "确认取消") then 
			self.确认按钮:更新(Q_游戏数据.鼠标坐标.x,Q_游戏数据.鼠标坐标.y)
			self.取消按钮:更新(Q_游戏数据.鼠标坐标.x,Q_游戏数据.鼠标坐标.y)
				
			if (self.确认按钮:取是否单击() or 引擎:取按键按下(键_回车)) then 
					
				if (self.事件 == "出售道具") then 
					Q_系统:增加金币(self.道具对象.价格* self.出售数量/2)
					
					if (self.出售数量 < self.道具对象.数量) then --只出售了一部分
						Q_屏幕.包裹窗口:增加物品(self.道具对象,self.道具对象.数量-self.出售数量)
					end 
					
					self:关闭()
					
					
				elseif (self.事件 == "购买道具") then 
					if (self.道具对象 ~= nil) then 

						
						if (Q_屏幕.包裹窗口:增加物品(self.道具对象, self.购买数量)) then 
							Q_系统:增加金币(- self.道具对象.价格 * self.购买数量)
							self:关闭()
						end 
					
					end 
				
				end 

			end 
			
			if (self.取消按钮:取是否单击()) then 
			
				if (self.事件 == "出售道具") then 
					Q_屏幕.包裹窗口:增加物品(self.道具对象,self.道具对象.数量,false)
					
				end
				
				self:关闭()
				Q_游戏鼠标.模式 = "普通"
			end 
		
		elseif (self.类型 == "确认") then 
			self.确认按钮:更新(Q_游戏数据.鼠标坐标.x,Q_游戏数据.鼠标坐标.y)
			
			if (self.确认按钮:取是否单击() or 引擎:取按键按下(键_回车)) then 
				self:关闭()
			end 
			
			
		elseif (self.类型 == "分解") then 
			self.确认按钮:更新(Q_游戏数据.鼠标坐标.x,Q_游戏数据.鼠标坐标.y)
			self.取消按钮:更新(Q_游戏数据.鼠标坐标.x,Q_游戏数据.鼠标坐标.y)
			
			if (self.确认按钮:取是否单击() or 引擎:取按键按下(键_回车)) then 
			
			
				Q_分解强化窗口:启动()
				self:关闭()
			end 
			
			if (self.取消按钮:取是否单击()) then 
				self:关闭()
				Q_分解强化窗口.分解物格子 = 0
				Q_游戏鼠标.模式 = "普通"
			end 
			
		elseif (self.类型 == "分解成功") then 
			self.确认按钮:更新(Q_游戏数据.鼠标坐标.x,Q_游戏数据.鼠标坐标.y)
			if (self.确认按钮:取是否单击() or 引擎:取按键按下(键_回车)) then 
				
			
				self:关闭()
			end 
			
		elseif (self.类型 == "开罐子") then 
		
			
			self.袖珍罐_变化计次 = self.袖珍罐_变化计次 + dt 
			self.袖珍罐_摇奖时间 = self.袖珍罐_摇奖时间 + dt
		
			if (self.袖珍罐_变化计次 > self.袖珍罐_变化间隔) then 
				self.袖珍罐_罐子弧度 = 引擎:取随机小数(-0.3,0.3)
				self.袖珍罐_变化计次 = 0
			end 
			
			if (self.袖珍罐_摇奖时间 > 1 and self.袖珍罐_摇奖时间 < 3) then 
				self.袖珍罐_罐子精灵:置图片(self.袖珍罐_罐子破碎图片A)
			elseif (self.袖珍罐_摇奖时间 >= 3 and self.袖珍罐_摇奖时间 < 5) then 	
				self.袖珍罐_罐子精灵:置图片(self.袖珍罐_罐子破碎图片B)
			end 
		
			self.确认按钮:更新(Q_游戏数据.鼠标坐标.x,Q_游戏数据.鼠标坐标.y)
			self.取消按钮:更新(Q_游戏数据.鼠标坐标.x,Q_游戏数据.鼠标坐标.y)
			
			if (self.确认按钮:取是否单击() or 引擎:取按键按下(键_回车)) then 
				self:关闭()
			end 
			
			if (self.取消按钮:取是否单击()) then 
				self.袖珍罐_罐子所在格子 = 0	
				Q_全局音效.开罐子音效:停止()
			end 
			
			
		elseif (self.类型 == "数量输入") then 
			local 当前数量 = 0
			
			self.数量增十按钮:更新(Q_游戏数据.鼠标坐标.x,Q_游戏数据.鼠标坐标.y)
			self.数量减十按钮:更新(Q_游戏数据.鼠标坐标.x,Q_游戏数据.鼠标坐标.y)
			self.数量增一按钮:更新(Q_游戏数据.鼠标坐标.x,Q_游戏数据.鼠标坐标.y)
			self.数量减一按钮:更新(Q_游戏数据.鼠标坐标.x,Q_游戏数据.鼠标坐标.y)
			self.数量输入框:更新(dt)
			
			self.确认按钮:更新(Q_游戏数据.鼠标坐标.x,Q_游戏数据.鼠标坐标.y)
			self.取消按钮:更新(Q_游戏数据.鼠标坐标.x,Q_游戏数据.鼠标坐标.y)
			
			if (self.事件 == "购买") then 
				self.总数量 =取整( Q_游戏数据.金币 / self.道具对象.价格)
				if (self.总数量 > 100) then 
					self.总数量 = 100
				end 
				
				
				if (self.数量输入框:取文本() == "") then  -- 空
					当前数量 = 0
				else 
					当前数量 = tonumber(self.数量输入框:取文本())
				end 
				
				
				if (self.数量增一按钮:取是否单击()) then 
					当前数量 = 当前数量 + 1
					if (当前数量 > self.总数量) then 
						当前数量 = self.总数量
					end 
					
					self.数量输入框:清空()
					self.数量输入框:插入文本(tostring(当前数量))
					
				elseif (self.数量减一按钮:取是否单击()) then 
					当前数量 = 当前数量 - 1
					if (当前数量 < 1) then 
						当前数量 = 1
					end 
					self.数量输入框:清空()
					self.数量输入框:插入文本(tostring(当前数量))
					
				end 
				
				
				if (self.数量增十按钮:取是否单击()) then 
					当前数量 = 当前数量 + 10
					if (当前数量 > self.总数量) then 
						当前数量 = self.总数量
					end 
					
					self.数量输入框:清空()
					self.数量输入框:插入文本(tostring(当前数量))
					
				elseif (self.数量减十按钮:取是否单击()) then 
					当前数量 = 当前数量 - 10
					if (当前数量 < 1) then 
						当前数量 = 1
					end 
					self.数量输入框:清空()
					self.数量输入框:插入文本(tostring(当前数量))
					
				end 
				
				
				if (当前数量 > 100) then 
					当前数量 = self.总数量
					self.数量输入框:清空()
					self.数量输入框:插入文本(tostring(当前数量))
					
				elseif (当前数量 < 1) then 
					当前数量 = 1
					self.数量输入框:清空()
					self.数量输入框:插入文本(tostring(当前数量))
					
				end 
				

				
				if (self.取消按钮:取是否单击()) then 
					self:关闭()
					Q_游戏鼠标.模式 = "普通"
				end 
				
				
				if (self.确认按钮:取是否单击() or 引擎:取按键按下(键_回车)) then 
				
					if (self.道具对象.价格* 当前数量 > Q_游戏数据.金币) then
						self:提示(-1,-1,
						按行格式化文本(string.format("金币不足，缺少%d金币！",self.道具对象.价格* 当前数量 - Q_游戏数据.金币),文字,10),
						"确认" )
						--Q_鼠标道具.id = 0
					else 
						self:提示(Q_游戏数据.鼠标坐标.x,Q_游戏数据.鼠标坐标.y,
						string.format("购买[%s]\n%d个%s",self.道具对象.名称,当前数量,按行格式化文本("需要金币" .. 取整(self.道具对象.价格*当前数量) .. ",确定要购买吗？",文字,10)),
						"确认取消","购买道具",self.道具对象 ,当前数量)
					end 
					
				end 
			
			elseif (self.事件 == "出售") then 
				
				if (self.数量输入框:取文本() == "") then  -- 空
					当前数量 = 1
				else 
					当前数量 = tonumber(self.数量输入框:取文本())
				end 
				
				if (self.数量增一按钮:取是否单击()) then 
					当前数量 = 当前数量 + 1
					if (当前数量 > self.道具对象.数量) then 
						当前数量 = self.道具对象.数量
					end 
					
					self.数量输入框:清空()
					self.数量输入框:插入文本(tostring(当前数量))
					
				elseif (self.数量减一按钮:取是否单击()) then 
					当前数量 = 当前数量 - 1
					if (当前数量 < 1) then 
						当前数量 = 1
					end 
					self.数量输入框:清空()
					self.数量输入框:插入文本(tostring(当前数量))
					
				end 
				
				
				if (self.数量增十按钮:取是否单击()) then 
					当前数量 = 当前数量 + 10
					if (当前数量 > self.道具对象.数量) then 
						当前数量 = self.道具对象.数量
					end 
					
					self.数量输入框:清空()
					self.数量输入框:插入文本(tostring(当前数量))
					
				elseif (self.数量减十按钮:取是否单击()) then 
					当前数量 = 当前数量 - 10
					if (当前数量 < 1) then 
						当前数量 = 1
					end 
					self.数量输入框:清空()
					self.数量输入框:插入文本(tostring(当前数量))
					
				end 

				
				if (当前数量 > self.道具对象.数量) then 
					当前数量 = self.道具对象.数量
					self.数量输入框:清空()
					self.数量输入框:插入文本(tostring(self.道具对象.数量))
					
				elseif (当前数量 == 0) then 
					当前数量 = 1
					self.数量输入框:清空()
					self.数量输入框:插入文本(tostring(当前数量))
				
				end 
				
				if (self.取消按钮:取是否单击()) then 
					Q_屏幕.包裹窗口:增加物品(self.道具对象,self.道具对象.数量,false)
					self:关闭()
					Q_游戏鼠标.模式 = "普通"
				end 
				
				
				if (self.确认按钮:取是否单击() or 引擎:取按键按下(键_回车)) then 
					self:提示(Q_游戏数据.鼠标坐标.x,Q_游戏数据.鼠标坐标.y,
					string.format("出售[%s]\n%d个%s",self.道具对象.名称,当前数量,按行格式化文本("总出售价为" .. 取整(self.道具对象.价格*当前数量/2) .. "金币,确定要出售吗？",文字,10)),
					"确认取消","出售道具",self.道具对象 ,当前数量)
					
				end 
				
			
			end 
		

			
			
			
			
		end 

		
		
		if (self.包围盒:检测_点(Q_游戏数据.鼠标坐标.x,Q_游戏数据.鼠标坐标.y)) then 
			self.焦点 = true
		else 
			self.焦点 = false 
		end 
		
	else 
		self.焦点 = false 
		
		
	end 
	

end

--=============================================================================--
-- ■ 关闭
--=============================================================================--
function 信息提示框:关闭()
	self.可视 = false
	self.焦点 = false 
	Q_游戏数据.音效组.取消确定:播放()
--	self.袖珍罐_罐子所在格子 = 0	
--	Q_全局音效.开罐子音效:停止()
end 



--=============================================================================--
-- ■ 显示
--=============================================================================--
function 信息提示框:显示()
	
	if (self.可视) then 
		local  颜色值 = 0
		
		if (self.类型 == "确认取消"  ) then 
			显示风格框(self.坐标.x,self.坐标.y,self.总宽度,self.总高度,255,3) 
			文字_描边显示(文字,self.坐标.x + 13  ,self.坐标.y+ 15 ,self.提示内容,颜色_白,颜色_黑)
			self.确认按钮:显示()
			self.取消按钮:显示()
		elseif (self.类型 == "确认") then 
		

			显示风格框(self.坐标.x,self.坐标.y,self.总宽度,self.总高度,255,3) 
			文字_描边显示(文字,self.坐标.x + 13  ,self.坐标.y+ 15 ,self.提示内容,颜色_白,颜色_黑)
			self.确认按钮:显示()
			
		elseif (self.类型 == "分解") then 
			显示风格框(self.坐标.x,self.坐标.y,self.总宽度,self.总高度,255,3) 
			
			文字_描边显示(文字,self.坐标.x + 45  ,self.坐标.y+ 55 ,self.提示内容,颜色_白,颜色_黑)
			self.确认按钮:显示()
			self.取消按钮:显示()
			
			self.装备背景精灵:显示(self.坐标.x + 13  ,self.坐标.y+ 10)
			self.道具对象.精灵:显示(self.坐标.x + 15  ,self.坐标.y+ 11)
			
			if(self.道具对象.颜色值 == "IB") then 
				颜色值 = 颜色_白
			elseif(self.道具对象.颜色值 == "IL") then 
				颜色值 = -9906707
			end 
			
			文字_描边显示(文字,self.坐标.x + 116 - 取整( 文字:取宽度(self.道具对象.名称)/2 ) ,self.坐标.y+ 20 ,self.道具对象.名称,颜色值,颜色_黑)
			
		elseif (self.类型 == "分解成功") then 
			显示风格框(self.坐标.x,self.坐标.y,self.总宽度,self.总高度,255,3) 
			文字_描边显示(文字,self.坐标.x + 80  ,self.坐标.y+ 18 ,"装备分解成功！",颜色_白,颜色_黑)
			
			for n=1,table.getn(Q_分解强化窗口.分解物品组) do 
				self.装备背景精灵:显示(self.坐标.x + 25  ,self.坐标.y+ 50 + (n-1)*35)
				Q_游戏道具组[Q_分解强化窗口.分解物品组[n].id].精灵:显示(self.坐标.x + 27  ,self.坐标.y+ 50 + (n-1)*35+1)
				
				if(Q_游戏道具组[Q_分解强化窗口.分解物品组[n].id].颜色值 == "IB") then 
					颜色值 = 颜色_白
					
				elseif(Q_游戏道具组[Q_分解强化窗口.分解物品组[n].id].颜色值 == "IL") then 
					颜色值 = -9906707
					
				elseif(Q_游戏道具组[Q_分解强化窗口.分解物品组[n].id].颜色值 == "IZ") then 
					颜色值 = -5018625
					
				elseif(Q_游戏道具组[Q_分解强化窗口.分解物品组[n].id].颜色值 == "IH") then 
					颜色值 = -6908266
					
				elseif(Q_游戏道具组[Q_分解强化窗口.分解物品组[n].id].颜色值 == "IC") then 
					颜色值 = -2182565
					
				end 
				
				if (Q_分解强化窗口.分解物品组[n].数量>1) then 
					文字_描边显示(文字,
						self.坐标.x + 130 - 取整( 文字:取宽度(Q_游戏道具组[Q_分解强化窗口.分解物品组[n].id].名称 .. " X " .. Q_分解强化窗口.分解物品组[n].数量)/2 ) ,
						self.坐标.y+ 50 + (n-1)*35+10 ,Q_游戏道具组[Q_分解强化窗口.分解物品组[n].id].名称 .. " X " .. Q_分解强化窗口.分解物品组[n].数量,
						颜色值,颜色_黑)
						
				else 
					文字_描边显示(文字,
						self.坐标.x + 130 - 取整( 文字:取宽度(Q_游戏道具组[Q_分解强化窗口.分解物品组[n].id].名称)/2 ) ,
						self.坐标.y+ 50 + (n-1)*35+10 ,Q_游戏道具组[Q_分解强化窗口.分解物品组[n].id].名称,
						颜色值,颜色_黑)

				end 
				
				
				
			end 
			
			
			
			
			self.确认按钮:显示()
		
		elseif (self.类型 == "开罐子") then 
			显示风格框(self.坐标.x,self.坐标.y,self.总宽度,self.总高度,255,3) 
			
			
			文字_描边显示(文字,self.坐标.x + 122 -  math.ceil(文字:取宽度(self.袖珍罐_提示)/2) ,self.坐标.y+ 18 ,self.袖珍罐_提示,颜色_白,颜色_黑)
			
			
			if (self.袖珍罐_选中ID >0) then 
			
				if(Q_游戏道具组[self.袖珍罐_选中ID].颜色值 == "IB") then 
					颜色值 = 颜色_白
				elseif(Q_游戏道具组[self.袖珍罐_选中ID].颜色值 == "IL") then 
					颜色值 = -9906707
				elseif (Q_游戏道具组[self.袖珍罐_选中ID].颜色值 == "IZ") then
					颜色值 =-5018625
				elseif (Q_游戏道具组[self.袖珍罐_选中ID].颜色值 == "IH") then
					颜色值 =-6908266
				elseif (Q_游戏道具组[self.袖珍罐_选中ID].颜色值 == "IC") then
					颜色值 =-2182565

					
				end 
				
			
				文字_描边显示(文字,self.坐标.x + 125 -  math.ceil(文字:取宽度(Q_游戏道具组[self.袖珍罐_选中ID].名称)/2) ,self.坐标.y+ 175 ,Q_游戏道具组[self.袖珍罐_选中ID].名称,颜色值,颜色_黑)
			end 
			
		
			self.袖珍罐_进度条前景精灵:置显示区域(0,0,(self.袖珍罐_摇奖时间 / 5 ) * 158,8)
		
			self.袖珍罐_背景精灵:显示(self.坐标.x+ 23,self.坐标.y + 50)
			self.袖珍罐_进度条背景精灵:显示(self.坐标.x+ 45,self.坐标.y + 193)
			self.袖珍罐_进度条前景精灵:显示(self.坐标.x+ 46,self.坐标.y + 194)
			
			
			if (self.袖珍罐_摇奖时间 <= 5) then 
				self.袖珍罐_提示 = "正在开启袖珍罐"
				self.袖珍罐_罐子背景精灵:显示_高级(self.坐标.x+ 126,self.坐标.y + 113,self.袖珍罐_罐子弧度,1,1)
				
				if (self.袖珍罐_选中ID >0) then 
					Q_游戏道具组[self.袖珍罐_选中ID].精灵:显示(self.坐标.x + 110  ,self.坐标.y+ 110)
				end 
				self.袖珍罐_罐子精灵:显示_高级(self.坐标.x+ 126,self.坐标.y + 113,self.袖珍罐_罐子弧度,1,1)
				
				self.取消按钮:显示()
				
			else
				self.袖珍罐_提示 = "从袖珍罐中获得此物品"
				Q_游戏道具组[self.袖珍罐_选中ID].精灵:显示(self.坐标.x + 110  ,self.坐标.y+ 110)
				self.确认按钮:显示()
				
				if (self.袖珍罐_罐子所在格子 ~= 0 )then 
					if (Q_系统:增加物品(Q_游戏道具组[self.袖珍罐_选中ID].名称,1)) then 
						减少道具(self.袖珍罐_罐子格子)
						self.袖珍罐_罐子所在格子 = 0	
					else 
						Q_全局音效.开罐子音效:停止()
					end 
					
				end 
				
				
				
				
			end 
			
			if (self.袖珍罐_摇奖时间 > 1) then 
				self.袖珍罐_爆炸精灵A计次 = self.袖珍罐_爆炸精灵A计次 + dt 
				if (self.袖珍罐_爆炸精灵A计次<0.1)then 
					self.袖珍罐_爆炸精灵A:显示(self.坐标.x+ 33,self.坐标.y + 60)
				else
					self.袖珍罐_碎片精灵A:显示(self.坐标.x+ 43,self.坐标.y + 135)
				end 		
		
			end 
			
			if (self.袖珍罐_摇奖时间 > 3) then 
				self.袖珍罐_爆炸精灵B计次 = self.袖珍罐_爆炸精灵B计次 + dt 
				if (self.袖珍罐_爆炸精灵B计次<0.1)then 
					self.袖珍罐_爆炸精灵B:显示(self.坐标.x+ 33,self.坐标.y + 60)
				else
					self.袖珍罐_碎片精灵B:显示(self.坐标.x+ 43,self.坐标.y + 135)
					
				end 	
			end 
			
			
			
			if (self.袖珍罐_摇奖时间 >= 5) then 
				self.袖珍罐_摇奖时间 = 5
				self.袖珍罐_爆炸精灵C计次 = self.袖珍罐_爆炸精灵C计次 + dt 
				if (self.袖珍罐_爆炸精灵C计次<0.13)then 
					self.袖珍罐_爆炸精灵B:显示(self.坐标.x+ 33,self.坐标.y + 60)
					self.袖珍罐_爆炸精灵A:显示(self.坐标.x+ 33,self.坐标.y + 60)
				end 
				self.袖珍罐_碎片精灵C:显示(self.坐标.x+ 43,self.坐标.y + 135)
				self.袖珍罐_通明度 = self.袖珍罐_通明度 + self.袖珍罐_过渡值
				
				if (self.袖珍罐_通明度 > 200) then 
					self.袖珍罐_过渡值 = -self.袖珍罐_过渡值 
				end 
				
				if (self.袖珍罐_通明度 <= -255) then 
					self.袖珍罐_通明度 = 0
					self.袖珍罐_闪烁结束 = true
				end 
				
			else
				if (self.袖珍罐_变化计次 == 0) then 
					self.袖珍罐_选中ID  = 随机取道具(self.袖珍罐_随机道具组)[1]
				end 
			end 
			
			if (self.袖珍罐_闪烁结束 == false)then
				self.袖珍罐_遮罩精灵:置颜色(ARGB(self.袖珍罐_通明度,255,255,255))
				self.袖珍罐_遮罩精灵:显示(self.坐标.x+ 25,self.坐标.y + 52)
			end 

		
		
		
		
			
		elseif (self.类型 == "数量输入") then 
			
			self.数量输入框背景精灵:显示(self.坐标.x,self.坐标.y)
			self.确认按钮:显示()
			self.取消按钮:显示()
			
			self.数量输入框:显示(self.坐标.x + 39,self.坐标.y + 17)
			self.数量增十按钮:显示()
			self.数量减十按钮:显示()
			self.数量增一按钮:显示()
			self.数量减一按钮:显示()
			
			
			
		end 
		
		
		
		if (Q_调试) then 
			self.包围盒:显示()
		end 
		
	end 
	

end





