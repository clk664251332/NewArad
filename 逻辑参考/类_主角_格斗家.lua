--==============================================================================--
--╭━━╮┏━━╮╭━━╮╭━━╮╭╭╮╮╭━━╮　╭╭╮╮╭━━╮╭╮╭╮╭━━╮
--┃╭━╯┃╭╮┃┃╭━╯┃╭╮┃┃　　┃┃╭━╯　┃　　┃┃╭╮┃┃╰╯┃┃╭━╯
--┃╰━╮┃┃┃┃┃┃╭╮┃╰╯┃┃┃┃┃┃╰━╮　┃┃┃┃┃╰╯┃┃　╭╯┃╰━╮
--┃╭━╯┃┃┃┃┃┃┃┃┃╭╮┃┃╭╮┃┃╭━╯　┃╭╮┃┃╭╮┃┃　╰╮┃╭━╯
--┃╰━╮┃╰╯┃┃╰╯┃┃┃┃┃┃┃┃┃┃╰━╮　┃┃┃┃┃┃┃┃┃╭╮┃┃╰━╮
--╰━━╯┗━━╯╰━━╯╰╯╰╯╰╯╰╯╰━━╯  ╰╯╰╯╰╯╰╯╰╯╰╯╰━━╯
--
-- 作者:  创建:2011年3月27日23时36分26秒
--=============================================================================--

类_主角_格斗家  = class()



--=============================================================================--
-- ■ 构造函数
--=============================================================================--
function 类_主角_格斗家:初始化(坐标x,坐标y)
	
	self.标识类型 = "主角_格斗家"
	
	self.动作音效组 = {
		普通攻击 = {
			D2D_音效.创建("Dat/sound/fighter/ft_atk_01.wav"),
			D2D_音效.创建("Dat/sound/fighter/ft_atk_02.wav"),
			D2D_音效.创建("Dat/sound/fighter/ft_atk_03.wav")
		},
		猛烈攻击 = {
			D2D_音效.创建("Dat/sound/fighter/ft_axkick_01.wav"),
			D2D_音效.创建("Dat/sound/fighter/ft_axkick_02.wav")
		},
		
		前踢击中 = D2D_音效.创建("Dat/sound/other/axKick_hit.wav"),
		前冲攻击 = D2D_音效.创建("Dat/sound/other/axe_dmg.wav"),
		下段踢攻击 = D2D_音效.创建("Dat/sound/fighter/ft_lowkick_01.wav"),
		
		
		起跳 = D2D_音效.创建("Dat/sound/fighter/ft_jump.wav"),
		跳跃攻击 = {
			D2D_音效.创建("Dat/sound/fighter/ft_jumpkick_01.wav"),
			D2D_音效.创建("Dat/sound/fighter/ft_jumpkick_02.wav")
		},
		手套攻击音效 = {
			D2D_音效.创建("Dat/sound/fighter/bgloveb_01.wav"),
			D2D_音效.创建("Dat/sound/fighter/bgloveb_02.wav")
		},
		手套击中音效 = {
			D2D_音效.创建("Dat/sound/fighter/bgloveb_hit_01.wav"),
			D2D_音效.创建("Dat/sound/fighter/bgloveb_hit_02.wav")
		},
		
		臂铠攻击音效 = {
			D2D_音效.创建("Dat/sound/fighter/weapon/guntA_01.wav"),
			D2D_音效.创建("Dat/sound/fighter/weapon/guntB_01.wav"),
			D2D_音效.创建("Dat/sound/fighter/weapon/guntB_02.wav"),
		},
		
		臂铠击中音效 = {
			D2D_音效.创建("Dat/sound/fighter/weapon/guntA_hit_01.wav"),
			D2D_音效.创建("Dat/sound/fighter/weapon/guntB_hit_01.wav"),
			D2D_音效.创建("Dat/sound/fighter/weapon/guntB_hit_02.wav"),
		},
		
		
		爪攻击音效 = {
			D2D_音效.创建("Dat/sound/fighter/weapon/clawA_01.wav"),
			D2D_音效.创建("Dat/sound/fighter/weapon/clawB_01.wav"),
			D2D_音效.创建("Dat/sound/fighter/weapon/clawB_02.wav"),
		},
		
		爪击中音效 = {
			D2D_音效.创建("Dat/sound/fighter/weapon/clawA_hit_01.wav"),
			D2D_音效.创建("Dat/sound/fighter/weapon/clawA_hit_02.wav"),
			D2D_音效.创建("Dat/sound/fighter/weapon/clawB_hit_01.wav"),
			D2D_音效.创建("Dat/sound/fighter/weapon/clawB_hit_02.wav"),
		},
		
		
		被攻击喊叫 = {
			D2D_音效.创建("Dat/sound/fighter/ft_dmg_01.wav"),
			D2D_音效.创建("Dat/sound/fighter/ft_dmg_02.wav"),
			D2D_音效.创建("Dat/sound/fighter/ft_dmg_03.wav"),
			D2D_音效.创建("Dat/sound/fighter/ft_dmg_04.wav")
		},
		
	}
	
	
	self.动作信息 = {
			停止 = 	{帧率 = 20,	起始帧 = 114,	结束帧 = 117,	计次 = 0 ,延时 = 0.3  , 下连激活 = false },
			待机 = 	{帧率 = 20,	起始帧 = 133,	结束帧 = 136,	计次 = 0 ,延时 = 0.3  , 下连激活 = false }, -- 战斗待机
			行走 = 	{帧率 = 13,	起始帧 = 137,	结束帧 = 144,	计次 = 0 ,延时 = 0.3  , 下连激活 = false },
			跑动 = 	{帧率 = 8,	起始帧 = 40,		结束帧 = 47,	计次 = 0 ,延时 = 0.3  , 下连激活 = false },
			小砍一 = {帧率 = 20,	起始帧 = 6,		结束帧 = 7	,计次 = 0 ,延时 = 0.3  , 下连激活 = false ,下连动作 = "小砍二"},
			小砍二 = {帧率 = 10,	起始帧 = 12,		结束帧 = 14	,计次 = 0 ,延时 = 0.3  , 下连激活 = false ,下连动作 = "小砍三"},
			小砍三 = {帧率 = 8,	起始帧 = 22,		结束帧 = 29	,计次 = 0 ,延时 = 0.2  , 下连激活 = false ,下连动作 = "小砍四"},
			小砍四 = {帧率 = 10,	起始帧 = 32,		结束帧 = 36	,计次 = 0 ,延时 = 0.05  , 下连激活 = false },
			前冲攻击 = {帧率 = 10,	起始帧 = 1,		结束帧 = 5	,计次 = 0 ,延时 = 0.3  , 下连激活 = false },
			跳跃_准备 = 	{帧率 = 10,	起始帧 = 48,		结束帧 = 48	,计次 = 0 ,延时 = 0.1  , 下连激活 = false },
			跳跃_上升 = 	{帧率 = 10,	起始帧 = 49,		结束帧 = 49	,计次 = 0 ,延时 = 0.3  , 下连激活 = false },
			跳跃_下落 = 	{帧率 = 10,	起始帧 = 49,		结束帧 = 49	,计次 = 0 ,延时 = 0.3  , 下连激活 = false },
			跳跃_落地 = 	{帧率 = 10,	起始帧 = 53,		结束帧 = 53	,计次 = 0 ,延时 = 0.3  , 下连激活 = false },
			捡物 = 	{帧率 = 10,	起始帧 = 37,		结束帧 = 38	,计次 = 0 ,延时 = 0.15  , 下连激活 = false },
			
			前踢 = 	{帧率 = 10,	起始帧 = 30,		结束帧 = 36	,计次 = 0 ,延时 = 0.3  , 下连激活 = false },
			下段踢 = 	{帧率 = 10,	起始帧 = 67,		结束帧 = 71	,计次 = 0 ,延时 = 0.3  , 下连激活 = false },
			
			
			
			被击中1 = 	{帧率 = 10,	起始帧 = 78,		结束帧 = 78	,计次 = 0 ,延时 = 0.15  , 下连激活 = false },
			被击中2 = 	{帧率 = 10,	起始帧 = 79,		结束帧 = 79	,计次 = 0 ,延时 = 0.15  , 下连激活 = false },
			
			被攻击_空中_起 = {帧率 = 20,	起始帧 = 79,		结束帧 = 79},
			被攻击_空中_落 = {帧率 = 20,	起始帧 = 80,		结束帧 = 80},
			被攻击_空中_反弹起 = {帧率 = 20,	起始帧 = 80,		结束帧 = 80},
			
			空中被击中1 = {帧率 = 20,	起始帧 = 80,		结束帧 = 80},
			空中被击中2 = {帧率 = 20,	起始帧 = 81,		结束帧 = 81},
			倒地 = {帧率 = 20,	起始帧 = 82,		结束帧 = 82},
			起身 = {帧率 = 20,	起始帧 = 39,		结束帧 = 39},
			
	}
	
	
	
	self.已经死亡 = false
	
	self.纸娃娃组 = {}
	self.纸娃娃组[1] = {名称= "默认", 位置 = "身体",次序=Q_游戏数据.遮挡次序["body"],动画 = 类_新PAK类.创建("Dat/pak/fighter/body/fighter_body_00.pak",114,true)}  -- 114:待机状态第一帧
	self.纸娃娃组[2] = {名称= "默认", 位置 = "发型",次序=Q_游戏数据.遮挡次序["hair_a"],动画 = 类_新PAK类.创建("Dat/pak/fighter/hair/fighter_hair_00_a.pak",114,true)}
	self.纸娃娃组[3] = {名称= "默认", 位置 = "发型",次序=Q_游戏数据.遮挡次序["hair_b"],动画 = 类_新PAK类.创建("Dat/pak/fighter/hair/fighter_hair_00_b.pak",114,true)}
	self.纸娃娃组[4] = {名称= "默认", 位置 = "发型",次序=Q_游戏数据.遮挡次序["hair_d"],动画 = 类_新PAK类.创建("Dat/pak/fighter/hair/fighter_hair_00_d.pak",114,true)}
	self.纸娃娃组[5] = {名称= "默认", 位置 = "下装",次序=Q_游戏数据.遮挡次序["pants_d"],动画 = 类_新PAK类.创建("Dat/pak/fighter/pants/fighter_pants_00_d.pak",114,true)}
	self.纸娃娃组[6] = {名称= "默认", 位置 = "鞋子",次序=Q_游戏数据.遮挡次序["shoes_a"],动画 = 类_新PAK类.创建("Dat/pak/fighter/shoes/fighter_shoes_00_a.pak",114,true)}
	self.纸娃娃组[7] = {名称= "默认", 位置 = "鞋子",次序=Q_游戏数据.遮挡次序["shoes_b"],动画 = 类_新PAK类.创建("Dat/pak/fighter/shoes/fighter_shoes_00_b.pak",114,true)}
	self.纸娃娃组[8] = {名称= "默认", 位置 = "上衣",次序=Q_游戏数据.遮挡次序["coat_a"],动画 = 类_新PAK类.创建("Dat/pak/fighter/coat/fighter_coat_00_a.pak",114,true)}
	self.纸娃娃组[9] = {名称= "默认", 位置 = "上衣",次序=Q_游戏数据.遮挡次序["coat_d"],动画 = 类_新PAK类.创建("Dat/pak/fighter/coat/fighter_coat_00_d.pak",114,true)}
	self.纸娃娃组[10] = {名称= "默认", 位置 = "武器",次序=Q_游戏数据.遮挡次序["glove_b"],动画 = 类_新PAK类.创建("Dat/pak/fighter/weapon/fighter_glove_none_00_b.pak",114,true)}
	self.纸娃娃组[11] = {名称= "默认", 位置 = "武器",次序=Q_游戏数据.遮挡次序["glove_c"],动画 = 类_新PAK类.创建("Dat/pak/fighter/weapon/fighter_glove_none_00_c.pak",114,true)}
	
	
	
	self.纸娃娃组_展示 = {}
	self.纸娃娃组_展示[1] = {名称= "默认", 位置 = "身体",次序=Q_游戏数据.遮挡次序["body"],动画 = 类_新PAK类.创建("Dat/pak/fighter/body/fighter_body_00.pak",114,true)}  -- 114:待机状态第一帧
	self.纸娃娃组_展示[2] = {名称= "默认", 位置 = "发型",次序=Q_游戏数据.遮挡次序["hair_a"],动画 = 类_新PAK类.创建("Dat/pak/fighter/hair/fighter_hair_00_a.pak",114,true)}
	self.纸娃娃组_展示[3] = {名称= "默认", 位置 = "发型",次序=Q_游戏数据.遮挡次序["hair_b"],动画 = 类_新PAK类.创建("Dat/pak/fighter/hair/fighter_hair_00_b.pak",114,true)}
	self.纸娃娃组_展示[4] = {名称= "默认", 位置 = "发型",次序=Q_游戏数据.遮挡次序["hair_d"],动画 = 类_新PAK类.创建("Dat/pak/fighter/hair/fighter_hair_00_d.pak",114,true)}
	self.纸娃娃组_展示[5] = {名称= "默认", 位置 = "下装",次序=Q_游戏数据.遮挡次序["pants_d"],动画 = 类_新PAK类.创建("Dat/pak/fighter/pants/fighter_pants_00_d.pak",114,true)}
	self.纸娃娃组_展示[6] = {名称= "默认", 位置 = "鞋子",次序=Q_游戏数据.遮挡次序["shoes_a"],动画 = 类_新PAK类.创建("Dat/pak/fighter/shoes/fighter_shoes_00_a.pak",114,true)}
	self.纸娃娃组_展示[7] = {名称= "默认", 位置 = "鞋子",次序=Q_游戏数据.遮挡次序["shoes_b"],动画 = 类_新PAK类.创建("Dat/pak/fighter/shoes/fighter_shoes_00_b.pak",114,true)}
	self.纸娃娃组_展示[8] = {名称= "默认", 位置 = "上衣",次序=Q_游戏数据.遮挡次序["coat_a"],动画 = 类_新PAK类.创建("Dat/pak/fighter/coat/fighter_coat_00_a.pak",114,true)}
	self.纸娃娃组_展示[9] = {名称= "默认", 位置 = "上衣",次序=Q_游戏数据.遮挡次序["coat_d"],动画 = 类_新PAK类.创建("Dat/pak/fighter/coat/fighter_coat_00_d.pak",114,true)}
	self.纸娃娃组_展示[10] = {名称= "默认", 位置 = "武器",次序=Q_游戏数据.遮挡次序["glove_b"],动画 = 类_新PAK类.创建("Dat/pak/fighter/weapon/fighter_glove_none_00_b.pak",114,true)}
	self.纸娃娃组_展示[11] = {名称= "默认", 位置 = "武器",次序=Q_游戏数据.遮挡次序["glove_c"],动画 = 类_新PAK类.创建("Dat/pak/fighter/weapon/fighter_glove_none_00_c.pak",114,true)}
	
	
	
	
	self.纸娃娃排序 = function(纸娃娃a, 纸娃娃b) return  纸娃娃a.次序 < 纸娃娃b.次序  end 
	
	table.sort(self.纸娃娃组,self.纸娃娃排序)	
	table.sort(self.纸娃娃组_展示,self.纸娃娃排序)	
	
	
	
	for n=1,#self.纸娃娃组 do
		self.纸娃娃组[n].动画:置中心点(250,380) 
	end
	
	
	for n=1,#self.纸娃娃组_展示 do
		self.纸娃娃组_展示[n].动画:置中心点(250,380) 
	end
	
	
	
	self.参照动画 = self.纸娃娃组[1].动画
	self.攻击判定动画 = self.纸娃娃组[11].动画
	

	
	self.速度 =  3
	self.模型大小 = 1
	self.状态 = "停止"
	self.方向 = 1  -- 右
	self.职业 = "格斗家"
	self.坐标 = {x=坐标x,y=坐标y}
	self.上次坐标 = {x=坐标x,y=坐标y}
	self.地图坐标 = {x=坐标x,y=坐标y}
	self.武器类型 = "手套"
	self.排序参照点 = 坐标y
	
	self.跳跃偏移 = 0
	self.硬直时间 = 0.03
	self.命中时间 = 0
	
	self.掉血特效组 = {}
	
	self.动作暂停 = false
	self.可移动 = true
	self.可攻击 = true
	self.跳跃中 = false
	self.小砍攻击中 = false
	self.被攻击中 = false
	
	self.跳跃影子 = false
	self.移动中 = false
	
	self.击退力量 = 0
	self.击退速度 = 0
	self.击退方向 = 0
	
	self.跳跃攻击次数 = 0
	self.跳跃攻击 = false
	self.跳跃攻击最后 = false 
	
	self.Y攻击范围 = 20
	self.空中被击动作 = 0
	
	
	self.白影信息 = 
	{
		精灵  = D2D_精灵.创建(0,0,0,0,0),
		颜色值 = 0,
		显示位置 = {x=0,y=0}
		
	}



	
	
	
	self.属性 = 
	{
		名称 = "独立游戏社",
		
		等级 = 10,
		经验值 = 0,
		力量 = 0,
		体力 = 0,
		智力 = 0,
		精神 = 0,
		物理攻击 = 1,
		魔法攻击 = 0,
		物理防御 = 0,
		魔法防御 = 0,
		暴击几率 = 10,
		hp = 50,
		maxhp = 50,
		mp = 50,
		maxmp = 50,
		重量 = 1,
		
		hp恢复速度 = 1,
		mp恢复速度 = 1,
		被击硬直时间 = 0.4,
		被击硬直计次 = 0,
		被击弹跳力 = 0,
		被击力量 = 0,
		反弹 = false,
		反弹力 = 0,
		开始反弹 = false,
		落地时间计次 = 0,
		
		
		
		
	}
	

	
	self.可前踢 = false
	self.可下段踢 = false
	
	
	self.回血计次 = 0
	
	
	
	self.弹跳力 = 0
	self.跳跃行为 = {类别="",前置动作=""}
	
	
	self.上一帧动画 = 0
	self.最后按下 = ""
	self.最后按键 = ""
	self.右键弹起时间 = 0
	self.左键弹起时间 = 0
	self.攻击键按下时间 = 0
	
	self.本次攻击结束 = true
	self.本次被击中怪物列表 = {}
	
	self.拥有捡取物品 = nil
	
	
	
end





--=============================================================================--
-- ■ 更新
--=============================================================================--
function 类_主角_格斗家:更新()
	
	
	if (引擎:取按键按下(键_空格)) then
		--self:被击中(nil,10,5)	
--		self:被打飞(6 ,4,true)
	
--		local 临时子弹 = 子弹类.创建(self.坐标.x + self.方向 * 15,self.坐标.y - 50,0,300,300,"哥布林石块",self.方向,self.坐标.y,self.状态)	
--		table.insert(Q_屏幕.屏幕子弹组,临时子弹)
--		Q_屏幕:增加屏幕物件(临时子弹)
		
		
		
		
	end

	if (引擎:取运行时间() - self.命中时间 < self.硬直时间) then 
		return 
	end	

	self.上一帧动画 = self.参照动画:取间隔帧()
	
	self.上次坐标.x =  self.坐标.x 
	self.上次坐标.y =  self.坐标.y
	
	self.地图坐标.x = self.坐标.x  + Q_游戏数据.画面偏移.x
	self.地图坐标.y = self.坐标.y  + Q_游戏数据.画面偏移.y
	
	self.排序参照点 = self.坐标.y
	
	self.移动中 = false
	
	
	if (self.动作暂停) then
		
		self.动作信息[self.状态].计次 = self.动作信息[self.状态].计次 + dt
		if (self.动作信息[self.状态].计次 >=  self.动作信息[self.状态].延时) then
			
			
			self.动作信息[self.状态].计次 = 0
			self.动作暂停 = false 
			
			if (self.动作信息[self.状态].下连激活) then
				self.动作信息[self.状态].下连激活 = false
				self:改变动作(self.动作信息[self.状态].下连动作)
				self:播放喊叫音效()
				
			else
				self:停止()
			end
			self.本次被击中怪物列表 = {}
			
			
			
		end
		
	else
		self:动作更新()
	end
	
	
	
	if (not self.已经死亡 and Q_游戏数据.屏幕焦点) then
		
		
		if (引擎:取按键按下(Q_游戏数据.按键配置["左"]) ) then
			self.最后按下 = "左键"
		end
		
		if (引擎:取按键按下(Q_游戏数据.按键配置["右"]) ) then
			self.最后按下 = "右键"
		end
		
		if ( self.击退力量 > 0) then 
			self.击退力量 = self.击退力量 - self.击退速度
			self:X方向位移(self.击退力量 * self.击退方向 )
		end 
		
		
		
		if (self.状态 == "倒地") then
			
			self.属性.落地时间计次 = self.属性.落地时间计次 + dt
			if (self.属性.落地时间计次 > 0.5) then
				self:停止()
			end
				
				
		elseif (self.状态 == "被攻击_空中_起" or   self.状态 == "被攻击_空中_反弹起") then
			self.属性.被击弹跳力 = self.属性.被击弹跳力 - dt * 25	
			
			if (self.属性.被击弹跳力 > 0) then
				
				self.跳跃偏移 = self.跳跃偏移- self.属性.被击弹跳力
				--self.坐标.y = self.坐标.y - self.属性.被击弹跳力
				self:X方向位移(-self.方向 * self.属性.被击力量)
			else
				self:改变动作("被攻击_空中_落")
			end	
			
		elseif (self.状态 == "被攻击_空中_落") then
			
			self.属性.被击弹跳力 = self.属性.被击弹跳力 + dt *30	
			
			if (self.跳跃偏移 < 0) then
				
				self.跳跃偏移  = self.跳跃偏移  + self.属性.被击弹跳力
				self:X方向位移(-self.方向 * self.属性.被击力量)
				
			else
				
				if (self.属性.反弹) then
					self:被打飞(self.属性.反弹力,1 ,false,false)
					self.属性.反弹 = false
				else 
					self:改变动作("倒地")
					self.属性.落地时间计次 = 0
				end
				
			end
			
			
		elseif (self.状态 == "被击中1" or self.状态 == "被击中2") then
			self.属性.被击硬直计次 = self.属性.被击硬直计次 + dt
			self.可移动 = false
			self.可攻击 = false
			
			
			if (self.属性.被击硬直计次>=self.属性.被击硬直时间) then
				self.属性.被击硬直计次 = 0
				
				self:停止()
				
			end
			
			
		elseif ( self.状态 == "前踢" ) then 
			
			if (self.上一帧动画 == 0 and  self.参照动画:取间隔帧() == 1 ) then 
				--self.技能特效 = Q_系统:显示特效(Q_格斗家_特效_管理器,"前踢",self.坐标.x,self.坐标.y,1,"普通",self.方向,1)
				
				Q_系统:增加屏幕特效("前踢", "地图坐标",self.坐标.x,self.坐标.y,self.方向 ,1,0,1) 
				
			elseif (self.上一帧动画 == 6 and  self.参照动画:取间隔帧() == 0 ) then 
				self:停止()
				self.本次被击中怪物列表 = {}
			end 	
			
			if (self.上一帧动画 >0 and self.上一帧动画 <5) then
				self:攻击判定()
			end
			
			
			
			
			
		elseif ( self.状态 == "下段踢" ) then 
			
			if (self.上一帧动画 == 4 and  self.参照动画:取间隔帧() == 0 ) then 
				self:停止()
				self.本次被击中怪物列表 = {}
			end 	
			
			
			if (self.上一帧动画 > 0 and self.上一帧动画 < 4) then
				self:攻击判定()
			end
			
		end
		
		
		
		
		self:移动逻辑()
		self:小砍逻辑()
		self:跳跃逻辑()
		
		
		self:技能逻辑()
		
		
		
		
		self.回血计次 = self.回血计次 + dt
		if (self.回血计次 >= 2) then
			self.属性.hp = self.属性.hp + self.属性.hp恢复速度
			self.属性.mp = self.属性.mp + self.属性.mp恢复速度
			
			if (self.属性.hp > self.属性.maxhp ) then
				self.属性.hp = self.属性.maxhp
			end
			
			if (self.属性.mp > self.属性.maxmp ) then
				self.属性.mp = self.属性.maxmp
			end
			
			self.回血计次 = 0
		end
		
		
		
	else
		
		
	end 
	


	
	
	if (self.上次坐标.x ~= self.坐标.x or self.上次坐标.y ~= self.坐标.y) then 
		
		
		for n=1 , #Q_地图.矩形_障碍层  do
			
			if(Q_地图.矩形_障碍层[n].包围盒:检测_点(self.坐标.x + Q_游戏数据.画面偏移.x,self.坐标.y ) ) then -- 接触到包围盒
				
				if (self.上次坐标.y ~= self.坐标.y) then
					
					if(Q_地图.矩形_障碍层[n].包围盒:检测_点(self.坐标.x + self.速度 * self.方向 + Q_游戏数据.画面偏移.x,self.上次坐标.y ) == false) then -- 接触到包围盒
					--	self.坐标.x = self.坐标.x + self.速度 * self.方向
						self.坐标.y = self.上次坐标.y 
		
						if (引擎:取按键事件 (键_键盘左) or 引擎:取按键事件 (键_键盘右)) then
							break 
						end 
						
						if (self.移动中) then
							if( self.方向 == -1 ) then 
							
								if (Q_地图:是否可行(self.坐标.x - self.速度,self.坐标.y )) then
									self.坐标.x = self.坐标.x - self.速度
								end
						
							else 
								if (Q_地图:是否可行(self.坐标.x + self.速度,self.坐标.y )) then
									self.坐标.x = self.坐标.x + self.速度
								end
							
							end
						end
						


						
					else
						self.坐标.x = self.上次坐标.x
						self.坐标.y = self.上次坐标.y 

						
					end
					
					break
				end
				
				
				if (self.上次坐标.x ~= self.坐标.x) then
					
					if(Q_地图.矩形_障碍层[n].包围盒:检测_点(self.上次坐标.x + Q_游戏数据.画面偏移.x,self.坐标.y+ self.速度  ) == false) then -- 接触到包围盒
					--	self.坐标.y = self.上次坐标.y  + self.速度
						self.坐标.x = self.上次坐标.x
						
						
						
						
						local 包围盒参照 = Q_地图.矩形_障碍层[n].包围盒:取顶点y () + Q_地图.矩形_障碍层[n].包围盒:取高度 () / 2
						
						
						if (self.移动中) then
							if ( self.坐标.y  < 包围盒参照) then
								
								
								if (Q_地图:是否可行(self.坐标.x,self.坐标.y - self.速度)) then
									self.坐标.y = self.坐标.y - self.速度
									
								end
								
								
							elseif (self.坐标.y  > 包围盒参照) then
								
								if (Q_地图:是否可行(self.坐标.x,self.坐标.y + self.速度)) then
									self.坐标.y = self.坐标.y + self.速度
									
								end
								
								
							end 
						end
						
						break
						
						
					else
						self.坐标.x = self.上次坐标.x
						self.坐标.y = self.上次坐标.y 
					end
					break
					
				end
				
				
				break
			end
			
			
		end
		
		
		
		
		if (Q_地图:是否可行(self.坐标.x ,self.坐标.y ) == false) then
			self.坐标.x = self.上次坐标.x
			self.坐标.y = self.上次坐标.y 
			
		end
		
		
		
		
		
		
	end


	
	
--	if (引擎:取按键按下(键_空格)) then
--		调试输出(Q_主角.拥有捡取物品)
--	end
	



	self.拥有捡取物品 = nil
	



	
end



--=============================================================================--
-- ■ 加入被击列表
--=============================================================================--
function 类_主角_格斗家:是否在被击列表(怪物对象)
	
	for n=1,#self.本次被击中怪物列表 do
		if (self.本次被击中怪物列表[n] == 怪物对象) then	
			return true 
		end
	end
	
	return false 
	
end





--=============================================================================--
-- ■ 显示
--=============================================================================--
function 类_主角_格斗家:显示()
	
	self.参照动画.影子可视 = true
	self.参照动画.影子y偏移 = __ED_精灵_取高度(self.参照动画.碎图片精灵)*0.6 * self.模型大小
	self.参照动画.影子透明度 = 100
	
	
-- 跳跃时 动态的改变影子效果 
	
	if (self.跳跃影子) then
		self.参照动画.影子_跳跃偏移.x = 0
		self.参照动画.影子_跳跃偏移.y =  -(self.跳跃偏移 + self.弹跳力 *3 -5 )
	else
		self.参照动画.影子_跳跃偏移.x = 0
		self.参照动画.影子_跳跃偏移.y = 0
	end
	
	
	
	
	if(self.白影信息.颜色值 > 10 ) then 
		self.白影信息.精灵:置混合模式(混合_单色)
		self.白影信息.颜色值 = self.白影信息.颜色值 - 10
		self.白影信息.精灵:置颜色(ARGB(self.白影信息.颜色值 ,255,255,255))
		self.白影信息.精灵:显示_高级(self.白影信息.显示位置.x,self.白影信息.显示位置.y,0,self.方向* self.模型大小,self.模型大小)
	end 
	
	

	
	
	
	
	
	
	for n=1,#self.纸娃娃组 do
		self.纸娃娃组[n].动画:显示( self.坐标.x  + Q_游戏数据.画面偏移.x,  self.坐标.y +self.跳跃偏移 + Q_游戏数据.画面偏移.y,self.模型大小*self.方向,self.模型大小)
	end
	
	self:掉血动画显示()
	
	if (Q_调试) then 
		引擎:画圆(self.坐标.x  + Q_游戏数据.画面偏移.x ,self.坐标.y, 5,50,颜色_黄)
		--self.纸娃娃组[11].动画.包围盒显示 = true
		self.纸娃娃组[1].动画.包围盒显示 = true
	else
		--self.纸娃娃组[11].动画.包围盒显示 = false
		self.纸娃娃组[1].动画.包围盒显示 = false
	end 
	
	
	
	
end





--=============================================================================--
-- ■ 被击退
--=============================================================================--
function 类_主角_格斗家:被击退(力量,速度,方向)

	self.击退力量 = 力量
	self.击退速度 = 速度
	self.击退方向 = 方向
	
	
	--self.AI时间 = 引擎:取运行时间 ()
	
end 



--=============================================================================--
-- ■ 被击中
--=============================================================================--

function 类_主角_格斗家:被击中(来源,掉血值,基础掉血值)	
	
	
	
--	self.上次被攻击.来源 = 来源
	
--	if (self.上次被攻击.来源 == 来源 and self.上次被攻击.参考 == 参考) then
--		return false
--	else
--		self.上次被攻击.来源 = 来源
--		self.上次被攻击.参考 = 参考
--		self.上次被攻击.时间 = 引擎:取运行时间()
--	end

	self.被攻击中 = true
	if (self.跳跃偏移 ~=0) then
		if (self.属性.被击弹跳力 ~=0) then
			self.空中被击动作 = 引擎:取随机整数(1,2)
			self:被打飞(4 ,2,true,false)
			
		else
			
			self:被打飞(6 ,3,true,false)
		end
		
		
	else
		self:改变动作("被击中" .. 引擎:取随机整数(1,2))
		
	end
	
	
	self.动作音效组.被攻击喊叫[引擎:取随机整数(1,4)]:播放()

	
--	Q_屏幕.顶部动态血条:置属性(150,self.属性.hp,self.属性.maxhp,掉血值)
	
	self.属性.hp = self.属性.hp - 掉血值
	
	if(self.属性.hp <= 0) then
		self:死亡()
	end
	
	self.可攻击 = false
	
	
	local 临时掉血特效= {	激活 = true ,
							显示位置x = self.坐标.x + 4,
							显示位置y = self.坐标.y  + self.跳跃偏移 -70,
							透明度 = 255 ,
							间隔值x = 0.3 ,
							特效大小 = 0.5 ,
							临时值 = 0 ,
							当前值 = 0 ,
							a = 0 ,
							b = 0 ,
							x = 0 ,
							y = 0 ,
							移动消失 = false,
							数字 =掉血值,
							已经消失 = false,
							临时变量 = 0
					}
	临时掉血特效.类型 = "数字"
	临时掉血特效.颜色 = "红"
	
	
	
	if (掉血值 >= 基础掉血值 * 1.4) then
		临时掉血特效.特效大小 = 0.8
		
	elseif (掉血值 >= 基础掉血值 * 1.2) then
		临时掉血特效.特效大小 = 0.6
		
	end
	
	
	table.insert(self.掉血特效组,临时掉血特效)	
	
	
	
	
	return true
	
	
	
	
	
end




--=============================================================================--
-- ■ 被打飞
--=============================================================================--
function 类_主角_格斗家:被打飞(弹力 ,力量,是否反弹,是否变向)

	--if (self.状态 ~="被攻击_空中_起") then
		
		
		self.属性.被击力量 = 力量
		self.属性.反弹 = 是否反弹
		
		if (self.属性.反弹) then
			self.属性.被击弹跳力 = 弹力 - self.属性.重量
			self.属性.反弹力  = self.属性.被击弹跳力 * 0.4
			self:改变动作("被攻击_空中_起")
			self.动作音效组.被攻击喊叫[引擎:取随机整数(1,4)]:播放()
		else
			self.属性.被击弹跳力 = 弹力
			self.属性.反弹力  = 0
			self:改变动作("被攻击_空中_反弹起")
		end
		
		self.可移动 = false
		self.可攻击 = false
		
		
	--end

end 









--=============================================================================--
-- ■ 停止
--=============================================================================--

function 类_主角_格斗家:停止()	


	self:改变动作("停止")
	
	self.可移动 = true
	self.可攻击 = true
	
	
	self.被攻击中 = false 
	self.跳跃中 = false 
	self.小砍攻击中 = false
	
	self.跳跃中 = false
	self.弹跳力 = 0
	self.跳跃偏移 = 0
	
	self.跳跃攻击= false
	self.跳跃攻击次数  = 0
	self.跳跃攻击最后 = true 
	
	self.属性.被击弹跳力 = 0
	self.属性.被击力量 = 0
	self.属性.被击硬直计次 = 0
		
	self.空中被击动作 = 0
	
	self.可前踢 = true
	self.可下段踢 = true
	
	
end



--=============================================================================--
-- ■ 死亡
--=============================================================================--

function 类_主角_格斗家:死亡()	


end


--=============================================================================--
-- ■ 伤害计算
--=============================================================================--

function 类_主角_格斗家:伤害计算(技能ID,本次怪物目标)	

	local 本次命中值 = 0
	local 最终伤害  = 0
	local 基础伤害  = 0
	local 保底伤害 =取整_(self.属性.物理攻击/2) + 引擎:取随机整数(1,3)		
	
	if (技能ID == 0) then
		
		基础伤害 = math.ceil( (self.属性.物理攻击  - 本次怪物目标.属性.物理防御) * 引擎:取随机小数(0.9 ,1)) 
		
		if ( 基础伤害 <= 0 ) then 
			
			最终伤害 = 保底伤害
			基础伤害 = 保底伤害
			
		else 
			基础伤害 = 保底伤害  + 基础伤害
			最终伤害 = 取整_( 基础伤害 * 引擎:取随机小数(0.8,1.3) )
			
		end 

		if (引擎:取随机整数(1,100) <= self.属性.暴击几率) then -- 出现暴击
			最终伤害 = 取整_( 最终伤害 * 引擎:取随机小数(1.1,1.8) )
		end
		
		
		
		
		
	end
	


	
	return 最终伤害,基础伤害

	
	
end






--=============================================================================--
-- ■ 攻击判定
--=============================================================================--
function 类_主角_格斗家:攻击判定()
	
	
	for n=1,#Q_屏幕.屏幕怪物组 do
		
		if ( not Q_屏幕.屏幕怪物组[n].已经死亡 and   math.abs(self.坐标.y-Q_屏幕.屏幕怪物组[n].坐标.y)<=   self.Y攻击范围 and not self:是否在被击列表(Q_屏幕.屏幕怪物组[n])) then -- 不在已经被攻击中的列表中
			
			
			local 是否击中 = false
			
			if ( self.状态 == "小砍一" or self.状态 == "小砍二" or self.状态 == "小砍三") then 
				是否击中 = __包围盒碰撞检测(self.攻击判定动画.动画包围盒,Q_屏幕.屏幕怪物组[n].纸娃娃组[1].动画.动画包围盒)
				打击点Y偏移 = Q_屏幕.屏幕怪物组[n]:取素材中心点Y()
				
				
			elseif (self.状态 == "小砍四" or self.状态 == "前冲攻击" or self.状态 == "下段踢"  or self.状态 == "前踢") then
				是否击中 = __包围盒碰撞检测(self.纸娃娃组[1].动画.动画包围盒,Q_屏幕.屏幕怪物组[n].纸娃娃组[1].动画.动画包围盒)
				
			elseif (self.跳跃攻击) then
				
				if ((self.方向 == 1 and Q_屏幕.屏幕怪物组[n].坐标.x > self.坐标.x) or (self.方向 == -1 and Q_屏幕.屏幕怪物组[n].坐标.x < self.坐标.x) ) then
					是否击中 = __包围盒碰撞检测(self.纸娃娃组[1].动画.动画包围盒,Q_屏幕.屏幕怪物组[n].纸娃娃组[1].动画.动画包围盒)
				end
				
				
				
			end
			
			
			if (是否击中) then
				if (Q_屏幕.屏幕怪物组[n]:被击中(self,self:伤害计算(0,Q_屏幕.屏幕怪物组[n]))) then
					
					
					if (self.状态 == "小砍四" or self.跳跃攻击) then
						self.动作音效组.前踢击中:播放()
					elseif (self.状态 == "前冲攻击") then
						self.动作音效组.前冲攻击:播放()
					else
						self.动作音效组[self.武器类型 .. "击中音效"][引擎:取随机整数(1,#self.动作音效组[self.武器类型 .. "击中音效"])]:播放()
					end
					
					
					
					local 血花大小 = 引擎:取随机小数(0.8,1.1)
					
					if (self.武器类型 == "爪" ) then 
						if (self.状态 == "小砍一") then
							Q_系统:增加屏幕特效("割伤A", "地图坐标",Q_屏幕.屏幕怪物组[n].坐标.x,Q_屏幕.屏幕怪物组[n].坐标.y - Q_屏幕.屏幕怪物组[n]:取素材中心点Y(),-self.方向 * 血花大小,血花大小,0,1)
						elseif (self.状态 == "小砍二") then
							Q_系统:增加屏幕特效("割伤B", "地图坐标",Q_屏幕.屏幕怪物组[n].坐标.x,Q_屏幕.屏幕怪物组[n].坐标.y - Q_屏幕.屏幕怪物组[n]:取素材中心点Y(),-self.方向 * 血花大小,血花大小,0,1)
						elseif (self.状态 == "小砍三") then
							Q_系统:增加屏幕特效("割伤A", "地图坐标",Q_屏幕.屏幕怪物组[n].坐标.x,Q_屏幕.屏幕怪物组[n].坐标.y - Q_屏幕.屏幕怪物组[n]:取素材中心点Y(),self.方向 * 血花大小,血花大小,0,1)
						else
							Q_系统:增加屏幕特效("打击" .. 引擎:取随机整数(1,3), "地图坐标",Q_屏幕.屏幕怪物组[n].坐标.x,Q_屏幕.屏幕怪物组[n].坐标.y - Q_屏幕.屏幕怪物组[n]:取素材中心点Y(),-self.方向 * 血花大小*0.8,血花大小*0.8,0,1) 
						end
					else
						Q_系统:增加屏幕特效("打击" .. 引擎:取随机整数(1,3), "地图坐标",Q_屏幕.屏幕怪物组[n].坐标.x,Q_屏幕.屏幕怪物组[n].坐标.y - Q_屏幕.屏幕怪物组[n]:取素材中心点Y(),-self.方向 * 血花大小*0.8,血花大小*0.8,0,1)
					end 
					

					Q_系统:增加屏幕特效("湔血大", "地图坐标",Q_屏幕.屏幕怪物组[n].坐标.x + self.方向 * 20,Q_屏幕.屏幕怪物组[n].坐标.y - Q_屏幕.屏幕怪物组[n]:取素材中心点Y()/2,-self.方向 * 血花大小*0.8,血花大小*0.8,0,1)
					table.insert(self.本次被击中怪物列表,Q_屏幕.屏幕怪物组[n])
					
					if (self.状态 == "小砍四") then
						Q_屏幕.屏幕怪物组[n]:被打飞(5,2,true,false)
						
					elseif (self.状态 == "前冲攻击") then
						Q_屏幕.屏幕怪物组[n]:被打飞(7,3,true,false)
						
					elseif (self.状态 == "前踢") then
						Q_屏幕.屏幕怪物组[n]:被打飞(7,3,true,false)
						
						
					end
					
					
					
					
				end
			end
			
		end
		
		
	end
	
	
	
end




--=============================================================================--
-- ■ 小砍逻辑
--=============================================================================--
function 类_主角_格斗家:小砍逻辑()
	
	
	if (not self.可攻击) then
		return 
	end
	
	if (self.跳跃中 ) then
		
		if (self.状态 == "跳跃_上升" or self.状态 == "跳跃_下落" ) then
			
			if (引擎:取按键按下(Q_游戏数据.按键配置["攻击"])  and self.跳跃行为.类别 == "普跳") then
				
				
				if (self.跳跃攻击次数 == 0) then 
					self.跳跃攻击= true
					self.跳跃攻击次数  = 1
					self.跳跃攻击最后 = false 
					self:PAK动画重置()
					self.动作音效组["跳跃攻击"][引擎:取随机整数(1,2)]:播放()
				end 
				
				
			end
			
			
		end
		
		
		if (self.跳跃攻击 ) then
			self:攻击判定()
		end
		
		
		return
	end
	

	
	
	if ( self.状态 == "小砍一") then 
		
		
		if (self.参照动画:取间隔帧() == 1) then -- 最后帧
			self.动作暂停 = true
		end 
		
		
		self:攻击判定()
		
		
		
	elseif ( self.状态 == "小砍二") then 
		
		if (self.参照动画:取间隔帧() == 1) then -- 
			
			if ( 引擎:取按键事件(键_键盘右) or 引擎:取按键事件(键_键盘左)) then 
				self:X方向位移(self.速度  * self.方向 * 6) 
			else 
				self:X方向位移(self.速度  * self.方向 * 1.2) 
			end 
			
		elseif (self.参照动画:取间隔帧() == 2) then -- 最后帧
			self.动作暂停 = true
			
		end 
		
		
		if (self.上一帧动画 > 0) then
			self:攻击判定()
		end
		
		
		
		
	elseif ( self.状态 == "小砍三") then 
		
		
		if (self.参照动画:取间隔帧() == 1) then -- 
			if ( 引擎:取按键事件(键_键盘右) or 引擎:取按键事件(键_键盘左)) then 
				self:X方向位移(self.速度  * self.方向 * 4) 
			else 
				self:X方向位移(self.速度  * self.方向 * 1.2) 
			end
		else
			
			if (self.动作信息[self.状态].下连激活 ) then  -- 如果第四连激活 那么提前最后结束帧
				if (self.参照动画:取间隔帧() == 4) then 
					self.动作暂停 = true
				end
			end
			
			if (self.参照动画:取间隔帧() == 7) then -- 最后帧
				self.动作暂停 = true
				
			end
			
		end 
		
		
		if (self.上一帧动画 > 0  and self.上一帧动画 < 5) then
			self:攻击判定()
		end
		
		
		
		
	elseif ( self.状态 == "小砍四") then 
	
		if (self.参照动画:取间隔帧() == 0) then -- 
			
			if ( 引擎:取按键事件(键_键盘右) or 引擎:取按键事件(键_键盘左)) then 
				self:X方向位移(self.速度  * self.方向 * 2) 
			else 
				self:X方向位移(self.速度  * self.方向 * 0.6) 
			end
			
		elseif (self.参照动画:取间隔帧() == 4) then -- 最后帧
			self.动作暂停 = true

		end 
		
		if (self.上一帧动画 > 0  and self.上一帧动画 <4 ) then
			self:攻击判定()
		end
		
		
		
	elseif ( self.状态 == "前冲攻击") then 
		
		if (self.上一帧动画 <= 2) then 
			self:X方向位移(self.速度  * self.方向  * 1.4) 
		elseif (self.参照动画:取间隔帧() ==4) then 
			self.动作暂停 = true
		end 
		
		if (self.上一帧动画 > 0) then
			self:攻击判定()
		end
		
	elseif ( self.状态 == "捡物") then 
		

		if (self.上一帧动画 == 0 and self.参照动画:取间隔帧() == 1) then 
			self.动作暂停 = true
			
			if (self.拥有捡取物品 ~= nil and Q_屏幕.包裹窗口:增加物品(self.拥有捡取物品.物品,self.拥有捡取物品.数量,true) ) then 
--					if (self.地面物品组[n].物品.总类 ~= "金币") then 
--						MSG(1,string.format("获得了%s。" ,self.地面物品组[n].物品.名称) ,颜色_黄,颜色_红)
--					end 
--					
				
				
				self.拥有捡取物品.已经消失 = true 
				
			end 
			
			
		end 
		
	end 
	
	
	
	
	if ( 引擎:取按键按下(Q_游戏数据.按键配置["攻击"]) ) then 
		
		
		if (self.状态=="跑动") then  -- 跑动接前冲攻击
			self:改变动作("前冲攻击")
			self:播放喊叫音效()
			self.可移动 = false
			self.小砍攻击中 = true
			
			
			
		elseif (self.状态 == "小砍一") then
			
			self.动作信息[self.状态].下连激活 = true
			self.动作信息[self.状态].计次 = self.动作信息[self.状态].延时 * 0.8 -- 按键越快 动作衔接越快	
			
		elseif (self.状态 == "小砍二") then
			
			self.动作信息[self.状态].下连激活 = true
			self.动作信息[self.状态].计次 =  self.动作信息[self.状态].延时 * 0.8 -- 按键越快 动作衔接越快	
			
		elseif (self.状态 == "小砍三") then
			
			if (self.参照动画:取间隔帧() > 2) then  -- 想连最后一击要等下帧时间 增加操作感
				self.动作信息[self.状态].下连激活 = true
			end
			
			self.动作信息[self.状态].计次 =  self.动作信息[self.状态].延时 * 0.8 -- 按键越快 动作衔接越快	
			
			
		elseif (self.状态 == "小砍四") then
			
			
		elseif (self.状态 == "前冲攻击") then
			
			
			
		elseif (self.状态 == "捡物") then
			
			
			
		else
		
			if (self.拥有捡取物品 ~= nil) then
				self:改变动作("捡物")
				self.可移动 = false
				
				return
			end
			
	
			
			
			self:改变动作("小砍一")
			self:播放喊叫音效()
			self.可移动 = false
			self.小砍攻击中 = true
			self.本次被击中怪物列表 = {}
			
			
			
			
			
		end
		
		
	end
	
	
	
	
	
end





--=============================================================================--
-- ■ 跳跃逻辑
--=============================================================================--
function 类_主角_格斗家:跳跃逻辑()
	
	
	
	if (引擎:取按键按下(Q_游戏数据.按键配置["跳跃"])) then 
		
		if ( 引擎:取按键事件( 键_键盘下)) then  -- 后跳
			
			if (self.跳跃中  or self.被攻击中) then  -- 已经在跳跃了 或者正在攻击中
				return
			end
			
			if (self.小砍攻击中) then
				self:显示白影()
			end
			
			
			self.跳跃行为.前置动作 = self.状态
			self.跳跃行为.类别 = "后跳"
			self:改变动作("跳跃_上升")	
			self.弹跳力 =3
			
			self.可移动 = true
			self.小砍攻击中 = false
			
		
			
			
		else
			
			if (self.跳跃中 or self.小砍攻击中 or self.被攻击中) then  -- 已经在跳跃了 或者正在攻击中
				return
			end
			
			self.跳跃行为.前置动作 = self.状态
			self.跳跃行为.类别 = "普跳"
			self:改变动作("跳跃_准备")
			
			
		end
		self.动作音效组.起跳:播放()
		Q_游戏数据.音效组["草地跳跃_起跳"]:播放()
		
		

		
		self.跳跃中 = true
		
end 
	
	
	if ( self.状态 == "跳跃_准备"  ) then 
		self.动作信息[self.状态].计次 = self.动作信息[self.状态].计次 + dt
		
		if ( self.动作信息[self.状态].计次 > self.动作信息[self.状态].延时) then 
			
			self:改变动作("跳跃_上升")	
			self.弹跳力 = 6.5
			self.跳跃影子 = true
		end 
		
	end 
	
	
	
	if (self.跳跃攻击 and  self.跳跃攻击最后 == false ) then 
		if (self.上一帧动画 == 1  ) then 
			self.跳跃攻击最后 = true
		end 
		
	end 
	
	
	if ( self.状态 == "跳跃_上升"  ) then 
		
		if (self.跳跃行为.类别 == "后跳") then 
			self.弹跳力 = self.弹跳力 - dt * 14
		else 
			self.弹跳力 = self.弹跳力 - dt * 15
		end 
		
		if (self.弹跳力 > 0) then 
			self.跳跃偏移 = self.跳跃偏移 - self.弹跳力*1.5
		--	self.坐标.y = self.坐标.y - self.弹跳力*1.5
		else 
			self:改变动作("跳跃_下落")
		end 
		
		
	end 
	
	
	if ( self.状态 == "跳跃_下落" ) then 

		if (self.跳跃行为.类别 == "后跳") then 
			self.弹跳力 = self.弹跳力 + dt * 22
		else 
			self.弹跳力 = self.弹跳力 + dt * 20
		end 
		
		self.跳跃偏移 = self.跳跃偏移 + self.速度 * 0.5
		if ( self.跳跃偏移  < 0 ) then 
			self.跳跃偏移 = self.跳跃偏移+ self.弹跳力 * 0.9
		else
			self.跳跃偏移 = 0
			self:改变动作("跳跃_落地")
			self.弹跳力 = 0
			self.跳跃影子 = false
			Q_游戏数据.音效组["草地跳跃_落地"]:播放()
		end

--		self.坐标.y = self.坐标.y  + self.速度 * 0.5
--		
--		if ( self.坐标.y  < self.地平线 ) then 
--			self.坐标.y = self.坐标.y + self.弹跳力 * 0.9
--			
--		else 
--			self.坐标.y = self.地平线
--			self:改变动作("跳跃_落地")
--			self.弹跳力 = 0
--			self.跳跃影子 = false
--			
--			Q_游戏数据.音效组["草地跳跃_落地"]:播放()
--		end 
--	
	
	
	
	end 
	
	
	
	
	if ( self.状态 == "跳跃_落地" ) then 
	
		if (self.跳跃行为.类别 == "后跳") then 
				self:改变动作("停止")
				self.跳跃攻击= false
				self.跳跃攻击次数 = 0
				self.跳跃中 = false
		else 
			self.动作信息[self.状态].计次 = self.动作信息[self.状态].计次 + dt
			
			if (self.动作信息[self.状态].计次 > 0.15) then 
				
				self:改变动作("停止")
				self.跳跃攻击= false
				self.本次被击中怪物列表 = {}
				self.跳跃攻击次数 = 0
				self.跳跃中 = false
			end 
		end
		
	end 
	
	
	
	
	

end




--=============================================================================--
-- ■ 移动逻辑
--=============================================================================--
function 类_主角_格斗家:移动逻辑()

	
	if (not self.可移动  ) then
		return
	end
	
	if (self.跳跃中) then 
		
		
		if (self.状态 == "跳跃_上升" or self.状态 == "跳跃_下落" ) then -- 跳跃中 移动加速
		
			if (self.跳跃行为.类别 == "后跳") then 
				if ( self.方向 == 1) then 
					self.坐标.x = self.坐标.x - self.速度 * 1.5
				else 
					self.坐标.x = self.坐标.x + self.速度 * 1.5
				end 
			
			else 
			
				if ( 引擎:取按键事件(键_键盘右)  ) then 
					
					if (not self.跳跃攻击) then
						self.方向 = 1
					end
					
					
					if (self.跳跃行为.前置动作 == "跑动") then
						self.坐标.x = self.坐标.x + self.速度 * 1.4
					else
						self.坐标.x = self.坐标.x + self.速度 * 0.8
					end
					
					
				end 
				
				if ( 引擎:取按键事件(键_键盘左) ) then 
					
					if (not self.跳跃攻击) then
						self.方向 = -1
					end
					
					if (self.跳跃行为.前置动作 == "跑动") then
						self.坐标.x = self.坐标.x - self.速度 * 1.4
					else
						self.坐标.x = self.坐标.x - self.速度 * 0.8
					end
					
					
				end 
				
				
				if ( 引擎:取按键事件(键_键盘上) ) then 
				
				
					local 下次y = self.坐标.y -  self.速度 * 0.3
		
					local  不可移动 = false 
					
				
					if (不可移动== false ) then 
						self.坐标.y = self.坐标.y -  self.速度 * 0.3
					end 
		
		
				end 
				
				
				if ( 引擎:取按键事件(键_键盘下) ) then 
		
					local 下次y = self.坐标.y +  self.速度 * 0.3
		
					local  不可移动 = false 
					
				
					if (不可移动== false ) then 
						self.坐标.y = self.坐标.y + self.速度 * 0.3
					end 
			
				end 
				
			end 
		
		end
		
		
		
		return
	end
	
	
	
	
	
	
	if (引擎:取按键按下(Q_游戏数据.按键配置["上"])) then 
		self.最后按键 = "键盘上"
	end 
	
	if (引擎:取按键按下(Q_游戏数据.按键配置["下"])) then 
		self.最后按键 = "键盘下"
	end 
	
	
	if (引擎:取按键按下(Q_游戏数据.按键配置["左"])) then 
		self.最后按键 = "键盘左"
	end 
	
	if (引擎:取按键按下(Q_游戏数据.按键配置["右"])) then 
		self.最后按键 = "键盘右"
	end 
	
	
	
	if (引擎:取按键事件(Q_游戏数据.按键配置["上"]) ) then
		
		if (引擎:取按键事件(Q_游戏数据.按键配置["下"]) and self.最后按键 == "键盘下") then 
			self:移动开始("下")
		else
			self:移动开始("上")
		end 
		
		if (引擎:取按键事件(Q_游戏数据.按键配置["左"]) ) then 
			self:移动开始("左")
		elseif (引擎:取按键事件(Q_游戏数据.按键配置["右"])) then 
			self:移动开始("右")
		end 

	elseif (引擎:取按键事件(Q_游戏数据.按键配置["下"]) ) then
	
		if (引擎:取按键事件(Q_游戏数据.按键配置["上"]) and self.最后按键 == "键盘上") then 
			self:移动开始("上")
		else
			self:移动开始("下")
		end 
			
		if (引擎:取按键事件(Q_游戏数据.按键配置["左"]) ) then 
			self:移动开始("左")
		elseif (引擎:取按键事件(Q_游戏数据.按键配置["右"])) then 
			self:移动开始("右")
		end 
			
			
			
	elseif (引擎:取按键事件(Q_游戏数据.按键配置["左"]) ) then
	
		if (引擎:取按键事件(Q_游戏数据.按键配置["右"]) and self.最后按键 == "键盘右") then 
			self:移动开始("右")
		else
			self:移动开始("左")
		end 
			
	
		if (引擎:取按键事件(Q_游戏数据.按键配置["上"]) ) then 
			self:移动开始("上")
		elseif (引擎:取按键事件(Q_游戏数据.按键配置["下"]) ) then 
			self:移动开始("下")
		end 
		

		
	elseif (引擎:取按键事件(Q_游戏数据.按键配置["右"]) ) then	
	
		if (引擎:取按键事件(Q_游戏数据.按键配置["左"]) and self.最后按键 == "键盘左") then 
			self:移动开始("左")
		else
			
			self:移动开始("右")
		end 
			
			
		if (引擎:取按键事件(Q_游戏数据.按键配置["上"]) ) then 
			self:移动开始("上")
		elseif (引擎:取按键事件(Q_游戏数据.按键配置["下"]) ) then 
			self:移动开始("下")
		end 
	end

	
	
	if (引擎:取按键弹起(Q_游戏数据.按键配置["左"]) ) then
		
		if(引擎:取按键事件(Q_游戏数据.按键配置["右"])) then
			self.最后按下 = "右键"
		else
			self.左键弹起时间 = 引擎:取运行时间()	
			self:改变动作("停止")
			self.最后按下=""
		end


	end	


	if (引擎:取按键弹起(Q_游戏数据.按键配置["右"]) ) then

		if(引擎:取按键事件(Q_游戏数据.按键配置["左"])) then
			self.最后按下 = "左键"
		else
			self.右键弹起时间 = 引擎:取运行时间()
			self:改变动作("停止")
			self.最后按下=""
		end

	end



-- 没有任何方向按键发生
	if ( not 引擎:取按键事件(Q_游戏数据.按键配置["上"])  and   
		not 引擎:取按键事件(Q_游戏数据.按键配置["下"])  and 
		not 引擎:取按键事件(Q_游戏数据.按键配置["左"])  and 
		not	引擎:取按键事件(Q_游戏数据.按键配置["右"]) ) then
		
		
		self.最后按键=""
		self:改变动作("停止",true)
	end

	


end 



--=============================================================================--
-- ■ 技能逻辑
--=============================================================================--
function 类_主角_格斗家:技能逻辑()
	

	if (self.状态 ~= "前踢"  and self:是否在空中状态() == false and self.状态 ~="前冲攻击" ) then 
		if (引擎:取按键事件(键_键盘上))then 
			if (引擎:取按键按下(键_Z) ) then 
				
				self:寻找发动技能("前踢")
				
				return
			end 
		end
	end 
	

	if (引擎:取按键事件(键_键盘下))then 
		if (引擎:取按键按下(键_Z) ) then 
			
			self:寻找发动技能("下段踢")
			
		end 
	end 
	
	
	
	
	
	
	
	
	
end






--=============================================================================--
-- ■ 播放喊叫音效
--=============================================================================--
function 类_主角_格斗家:播放喊叫音效(动作)
	
	if (self.状态 == "小砍一" or self.状态 == "小砍二" or self.状态 == "小砍三") then
		self.动作音效组["普通攻击"][引擎:取随机整数(1,3)]:播放()
		self.动作音效组[self.武器类型 .. "攻击音效"][引擎:取随机整数(1,#self.动作音效组[self.武器类型 .. "攻击音效"])]:播放()
		
	
	elseif (self.状态 == "小砍四") then
		self.动作音效组["猛烈攻击"][引擎:取随机整数(1,2)]:播放()
		
	elseif (self.状态 == "前冲攻击") then
		self.动作音效组["猛烈攻击"][2]:播放()
		
	end
	
	
	
	
	
end



--=============================================================================--
-- ■ X方向位移
--=============================================================================--
function 类_主角_格斗家:X方向位移(位移)
	
	self.坐标.x = self.坐标.x +位移
	
end 


--=============================================================================--
-- ■ 改变动作
--=============================================================================--
function 类_主角_格斗家:改变动作(动作,唯一)
	
	if ( 唯一 ~= nil ) then 
		
		if (self.状态 ~= 动作) then 
			self.状态 = 动作
			
			self:PAK动画重置()
			
			self:动作更新()
		end 
	
	else 
--		self.状态 = 动作
--		self.动作信息[self.状态].计次 = 0
--		self.动作信息[self.状态].下连激活 = false
		
		self.状态 = 动作

		self:PAK动画重置()
		self.上一帧动画 = 0
	
		self:动作更新()
		
		

	end 
	
	
--	if( 动作 == "小砍一"    or  动作 == "小砍二"  or 动作 == "小砍三"  or 动作 == "前刺攻击") then 
--	
--		self:随机喊叫()
--		
--	end 
	

end 



--=============================================================================--
-- ■ 移动开始
--=============================================================================--
function 类_主角_格斗家:移动开始(方向)
	

	
	
	local 下次y = self.坐标.y 
	local 下次x = self.坐标.x 
	
	
	if (方向 == "上") then
	
		if (self.状态 == "跑动") then
			下次y = self.坐标.y - self.速度 
		elseif (self.状态 == "行走") then
			下次y = self.坐标.y - self.速度 * 0.7
		else
			self:改变动作("行走")
		end
		

		
		self.坐标.y = 下次y

		
	elseif (方向 == "下") then
		
		if (self.状态 == "跑动") then
			下次y = self.坐标.y + self.速度 
		elseif (self.状态 == "行走") then
			下次y = self.坐标.y + self.速度 * 0.7
		else
			self:改变动作("行走")
		end
			
			
		self.坐标.y = 下次y
		
		
		
	elseif (方向 == "左") then
		
	
		self.方向 = -1
	
	
		if (引擎:取运行时间() - self.左键弹起时间 < 0.1) then
			self.左键弹起时间 = 引擎:取运行时间()
			self:改变动作("跑动",true)
			下次x = self.坐标.x - self.速度 * 1.6
		else
			self:改变动作("行走",true)
			下次x = self.坐标.x - self.速度
	
		end
	
		self.坐标.x = 下次x

		
	elseif (方向 == "右") then
		
		self.方向 = 1
	
		if (引擎:取运行时间() - self.右键弹起时间 < 0.1) then
			self.右键弹起时间 = 引擎:取运行时间()
			
			self:改变动作("跑动",true)
			下次x = self.坐标.x + self.速度 * 1.6
			
		else
			self:改变动作("行走",true)
			下次x = self.坐标.x + self.速度
		end
		
		self.坐标.x = 下次x
		
		
	end
	
	
	self.移动中 = true
	
	
end








--=============================================================================--
-- ■ 动作更新
--=============================================================================--

function 类_主角_格斗家:动作更新()	
	
	
	if (self.状态 ==  "跳跃_上升" or self.状态 ==  "跳跃_下落") then 
		
		if(self.跳跃攻击 ) then 
			
			if (self.跳跃攻击最后 == false ) then 
				self:PAK动画更新(15,56,57,"普通")
			else 
				self:PAK动画更新(20,57,57,"普通")
			end 
			
		else 
			self:PAK动画更新(self.动作信息[self.状态].帧率,self.动作信息[self.状态].起始帧,self.动作信息[self.状态].结束帧,"普通")   
		end 
		

	elseif (self.空中被击动作 > 0 and (self.状态 ==  "被攻击_空中_起" or self.状态 ==  "被攻击_空中_落")) then 
		
		local 动作 = "空中被击中" .. self.空中被击动作
		
		
		self:PAK动画更新(self.动作信息[动作].帧率,self.动作信息[动作].起始帧,self.动作信息[动作].结束帧,"普通")  
		
		
		
	else
		self:PAK动画更新(self.动作信息[self.状态].帧率,self.动作信息[self.状态].起始帧,self.动作信息[self.状态].结束帧,"普通")   
	end
	
	if (self.状态=="行走") then 
		
		if (Q_游戏数据.音效组["草地跳跃_走动"]:检测播放() == false) then 
			Q_游戏数据.音效组["草地跳跃_走动"]:播放()
		end 
		
	elseif (self.状态=="跑动") then 
		
		if (self.参照动画:取间隔帧() %2 ==0 and Q_游戏数据.音效组["草地跳跃_跑动"]:检测播放() == false) then 
			Q_游戏数据.音效组["草地跳跃_跑动"]:播放()
		end 
		
	end

	

	
	
	
	
	
	
end 



--=============================================================================--
-- ■ 掉血动画显示
--=============================================================================--
function 类_主角_格斗家:掉血动画显示()

	for n=1, table.getn(self.掉血特效组) do
	
		if(self.掉血特效组[n].透明度 < 10) then 
			table.remove(self.掉血特效组,n)
			break
		end 
	
	end 




	for n=1, table.getn(self.掉血特效组) do

		if(self.掉血特效组[n].已经消失==false )then 
		
		
			if (self.掉血特效组[n].激活) then
			
				self.掉血特效组[n].当前值 = self.掉血特效组[n].当前值 + self.掉血特效组[n].间隔值x
				
				if (self.掉血特效组[n].当前值 >= 3 or self.掉血特效组[n].当前值 <= 0) then
					self.掉血特效组[n].间隔值x = -self.掉血特效组[n].间隔值x
				end
				
				if (self.掉血特效组[n].类型 == "数字") then
				
					self.掉血特效组[n].a = self.掉血特效组[n].当前值 *15 * self.掉血特效组[n].特效大小
					self.掉血特效组[n].b = self.掉血特效组[n].当前值 * 13 * self.掉血特效组[n].特效大小
					self.掉血特效组[n].x = self.掉血特效组[n].当前值 * string.len(tostring (self.掉血特效组[n].数字)) * 8  * self.掉血特效组[n].特效大小
					self.掉血特效组[n].y = self.掉血特效组[n].当前值 * 7 *self.掉血特效组[n]. 特效大小
					
				elseif (self.掉血特效组[n].类型 == "文字") then 	
					self.掉血特效组[n].a = self.掉血特效组[n].当前值 * 65 * self.掉血特效组[n].特效大小
					self.掉血特效组[n].b = self.掉血特效组[n].当前值 * 65 * self.掉血特效组[n].特效大小
					self.掉血特效组[n].x = self.掉血特效组[n].当前值 * 16 * self.掉血特效组[n].特效大小
					self.掉血特效组[n].y = self.掉血特效组[n].当前值 * 15 *self.掉血特效组[n]. 特效大小
					
				end 

				if (self.掉血特效组[n].间隔值x < 0 and self.掉血特效组[n].当前值 * self.掉血特效组[n].特效大小 <=1) then
					self.掉血特效组[n].激活 = false
					self.掉血特效组[n].移动消失 = true
				end
				
				
			end
		
		
			if (self.掉血特效组[n].移动消失) then

				self.掉血特效组[n].临时值 = self.掉血特效组[n].临时值 + 1
				self.掉血特效组[n].y = self.掉血特效组[n].y + 3
				
				
				if (self.掉血特效组[n].临时值 > 10) then
					self.掉血特效组[n].透明度 = self.掉血特效组[n].透明度 - 30
				end

			end

			
			if (self.掉血特效组[n].透明度 > 10) then
				if (self.掉血特效组[n].类型 == "数字") then
					Q_屏幕.掉血精灵文字:显示(self.掉血特效组[n].数字,
								 self.掉血特效组[n].显示位置x - self.掉血特效组[n].x + Q_游戏数据.画面偏移.x ,
								  self.掉血特效组[n].显示位置y - self.掉血特效组[n].y + Q_游戏数据.画面偏移.y , 
								  self.掉血特效组[n].a, 
								  self.掉血特效组[n].b, 
								  self.掉血特效组[n].透明度,
								  self.掉血特效组[n].颜色)
				elseif (self.掉血特效组[n].类型 == "文字") then 
				
					if (self.掉血特效组[n].文字 == "MISS") then
						MISS精灵:置颜色(ARGB(self.掉血特效组[n].透明度,255,255,255))

						MISS精灵:显示_高级(self.掉血特效组[n].显示位置x - self.掉血特效组[n].x + Q_游戏数据.画面偏移.x ,
												 self.掉血特效组[n].显示位置y - self.掉血特效组[n].y + Q_游戏数据.画面偏移.y , 
												 0,
												 self.掉血特效组[n].a/65, 
												 self.掉血特效组[n].b/65)
					end 
					
					
					
				end 
				
				
			else 
				
				self.掉血特效组[n].移动消失 = false
				self.掉血特效组[n].已经消失 = true 

			end 
			

		end 

		
	end
	
	


end 

--=============================================================================--
-- ■ 是否在攻击状态
--=============================================================================--
function 类_主角_格斗家:是否在攻击状态()
	
	if( self.状态 == "小砍一"    ) then 
		return true 
	end 

	return false 

end 


--=============================================================================--
-- ■ 是否在空中状态
--=============================================================================--
function 类_主角_格斗家:是否在空中状态()
	
	if( self.状态 == "跳跃_上升"  or self.状态 == "跳跃_下落"  ) then 
		return true 
	end 

	return false 

end 










--=============================================================================--
-- ■ HP增加
--=============================================================================--

function 类_主角_格斗家:HP增加(增加值)	
	self.属性.hp = self.属性.hp + 增加值
	
	if (self.属性.hp > self.属性.maxhp) then 
		self.属性.hp = self.属性.maxhp
	end 	
	
	Q_游戏数据.音效组.HP增加音效:播放()
	Q_系统:增加屏幕特效("吃HP效果", "跟随主角",self.坐标.x,self.坐标.y - 50,1,1,0,1)

	
	
end 


--=============================================================================--
-- ■ MP增加
--=============================================================================--

function 类_主角_格斗家:MP增加(增加值)	
	self.属性.mp = self.属性.mp + 增加值
	
	if (self.属性.mp > self.属性.maxmp) then 
		self.属性.mp = self.属性.maxmp
	end 
	
	Q_游戏数据.音效组.MP增加音效:播放()
	Q_系统:增加屏幕特效("吃MP效果", "跟随主角",self.坐标.x,self.坐标.y - 50,1,1,0,1)

	
	
end 




--=============================================================================--
-- ■ 寻找发动技能
--=============================================================================--
function 类_主角_格斗家:寻找发动技能(技能名)

	
	for n=1,#Q_屏幕.技能窗口.技能格子组 do
		
		local 本次对象 = Q_屏幕.技能窗口.技能格子组[n].技能
		
		if (本次对象 ~= nil and 本次对象.名称 == 技能名) then
			
			if (本次对象.延时时间>0) then
				return false
			end
			
			if (not 本次对象.可用) then
				return false
			end
			
			
			
			if (本次对象.名称 == "前踢") then
				
				self.可移动 = false
				self.小砍攻击中 = false
				self.可攻击 = false
				self.可前踢 = false
				self.可下段踢 = false
				self:改变动作("前踢")
				self.动作音效组["猛烈攻击"][引擎:取随机整数(1,2)]:播放()
				
			elseif (本次对象.名称 == "下段踢") then
				
				self.可移动 = false
				self.小砍攻击中 = false
				self.可攻击 = false
				self:改变动作("下段踢")
				self.可前踢 = false
				self.可下段踢 = false
				self.动作音效组.下段踢攻击:播放()	
				
			end
			
			
			
			本次对象.延时时间参考 = 0
			本次对象.延时时间 = 本次对象.CD
			本次对象.CD特效:重置()
			
			
			if (本次对象.等级 < 4) then
				本次对象.熟练 = 本次对象.熟练 + 1
				
				if (本次对象.熟练 >= 100) then
					本次对象.熟练 = 0
					本次对象.等级 = 本次对象.等级+1 
				end
				
			end
			
			return true
		end
		
	end
	
	
	return false

end



--=============================================================================--
-- ■ 显示白影
--=============================================================================--
function 类_主角_格斗家:显示白影()
	

	self.白影信息.精灵:置图片(self.参照动画.动画资源.PAK信息组[self.参照动画.当前帧].图片)
	self.白影信息.精灵:置显示区域(0,0,引擎:取图片宽度(self.参照动画.动画资源.PAK信息组[self.参照动画.当前帧].图片),引擎:取图片高度(self.参照动画.动画资源.PAK信息组[self.参照动画.当前帧].图片))
	self.白影信息.颜色值 = 255
	self.白影信息.精灵:置中心点 (self.参照动画.中心点.x, self.参照动画.中心点.y)
	self.白影信息.显示位置.x = self.参照动画.临时位置.x
	self.白影信息.显示位置.y = self.参照动画.临时位置.y	


end






--=============================================================================--
-- ■ 更新纸娃娃
--=============================================================================--
function 类_主角_格斗家:更新纸娃娃(位置,名称,子类)
	
			
	if (位置 == "上衣" or 位置 == "武器" or 位置 == "下装"  or 位置 == "鞋子") then
		
		if (名称 == "默认") then
			名称 =  string.format("%s_%s_%s",self.职业,位置,名称)
			
			if (位置 == "武器") then -- 更新动作音效
				self.武器类型 = "手套"
			end
		else
			if (位置 == "武器") then -- 更新动作音效
				self.武器类型 = 子类
			end
			
		end	
		
		
		if (Q_游戏数据.纸娃娃配置组[名称] == nil) then
			return
		end
		
		for n=#self.纸娃娃组,1,-1 do 
			if ( self.纸娃娃组[n].位置 == 位置 and self.纸娃娃组[n].名称 == 名称) then  -- 相同的纸娃娃
				return 
			end 
		end 
		
		
		if (位置 == "武器") then -- 更新动作音效
			
			if (self.武器类型 == "手套") then 
				self.硬直时间 = 0.03
				
				
			elseif (self.武器类型 == "臂铠") then 
				self.硬直时间 = 0.11
				
			elseif (self.武器类型 == "爪") then 
				self.硬直时间 = 0.07
				
			end
			
			
			
			
		end
		
		
		
		
		for i=#self.纸娃娃组,1,-1 do 
			if ( self.纸娃娃组[i].位置 == 位置 ) then 
				table.remove(self.纸娃娃组,i)
			end 
		end 
		
		
		for i=#self.纸娃娃组_展示,1,-1 do 
			if ( self.纸娃娃组_展示[i].位置 == 位置 ) then 
				table.remove(self.纸娃娃组_展示,i)
			end 
		end 
		
		
		
	
		for n=1,#Q_游戏数据.纸娃娃配置组[名称] do
				
			local 新动画 = 
			{
				名称 = 名称,
				位置 = 位置,
				次序 = Q_游戏数据.遮挡次序[Q_游戏数据.纸娃娃配置组[名称][n].次序标识],
				动画 = 类_新PAK类.创建(Q_游戏数据.纸娃娃配置组[名称][n].素材标识,self.参照动画.当前帧,true)
			}
			
			
				
			local 新动画_展示 = 
			{
				名称 = 名称,
				位置 = 位置,
				次序 = Q_游戏数据.遮挡次序[Q_游戏数据.纸娃娃配置组[名称][n].次序标识],
				动画 = 类_新PAK类.创建(Q_游戏数据.纸娃娃配置组[名称][n].素材标识,self.参照动画.当前帧,true)
			}
			
			
			
			新动画.动画:置中心点(250,380) 
			新动画_展示.动画:置中心点(250,380) 
			
			新动画.动画:对象同步(self.参照动画)
			
			table.insert(self.纸娃娃组,新动画)
			table.insert(self.纸娃娃组_展示,新动画_展示)
			
			
			
			if (Q_游戏数据.纸娃娃配置组[名称][n].判定参考 ~= nil) then
				self.攻击判定动画 = 新动画.动画
			end
			
			
		end
		
		
		table.sort(self.纸娃娃组,self.纸娃娃排序)	
		table.sort(self.纸娃娃组_展示,self.纸娃娃排序)	
		
		
		self:PAK动画重置_展示()
		
	end
	
	
end






--=============================================================================--
-- ■ pak动画更新
--=============================================================================--
function 类_主角_格斗家:PAK动画更新(帧率,开始帧,结束帧,更新方式)
	
	
	if (更新方式 == "普通") then
		for n=1,#self.纸娃娃组 do
			self.纸娃娃组[n].动画:更新(帧率, 开始帧,结束帧)
		end
	elseif (更新方式 == "往返") then
		for n=1,#self.纸娃娃组 do
			self.纸娃娃组[n].动画:往返更新(帧率, 开始帧,结束帧)
		end
	elseif (更新方式 == "反向") then
		for n=1,#self.纸娃娃组 do
			self.纸娃娃组[n].动画:反向更新(帧率, 开始帧,结束帧)
		end
	end
	
	
end 




--=============================================================================--
-- ■ PAK动画重置
--=============================================================================--
function 类_主角_格斗家:PAK动画重置()

	for n=1,#self.纸娃娃组 do
		self.纸娃娃组[n].动画:重置()
	end

end 


--=============================================================================--
-- ■ PAK动画重置_展示
--=============================================================================--
function 类_主角_格斗家:PAK动画重置_展示()

	for n=1,#self.纸娃娃组_展示 do
		self.纸娃娃组_展示[n].动画:重置()
	end

end 

--=============================================================================--
-- ■ PAK动画置颜色
--=============================================================================--
function 类_主角_格斗家:PAK动画置颜色(颜色值)

	for n=1,#self.纸娃娃组 do
		self.纸娃娃组[n].动画:置颜色(颜色值)
	end

end 


--=============================================================================--
-- ■ PAK动画置混合
--=============================================================================--
function 类_主角_格斗家:PAK动画置混合(混合模式)

	for n=1,#self.纸娃娃组 do
		self.纸娃娃组[n].动画:置混合(混合模式)
	end
	
end 


