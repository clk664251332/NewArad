using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AttrAbility : BaseAbility
{
    private AttributeNode m_attributeAll; //最终属性
    private AttributeNode m_attributeGrowth;//级别的属性加成，也可视为基础属性
    private AttributeNode m_attributeEquip;//装备的属性加成
    private AttributeNode m_attributeBuff;//Buff的属性加成

    public override void GetComponent()
    {
        base.GetComponent();
    }

    public override void Initialize()
    {
        base.Initialize();
        //当升级/装备武器/增减Buff时发送该事件进行属性重新计算
        m_owner.m_actorEventHandler.AddEvent(EEventType.AttrChange, new Callback(ReCalculate));
        m_attributeAll = new AttributeNode(this);
        m_attributeGrowth = new GrowthAttrNode(this);
        m_attributeEquip = new EquipAttrNode(this);
        m_attributeBuff = new BuffAttrNode(this);
        //添加子节点
        m_attributeAll.AddChildNode(m_attributeGrowth);
        m_attributeAll.AddChildNode(m_attributeEquip);
        m_attributeAll.AddChildNode(m_attributeBuff);
        //各个分支属性的初始化
        m_attributeGrowth.Initialize();
        m_attributeEquip.Initialize();
        m_attributeBuff.Initialize();
        //计算
        m_attributeAll.Calculate();
    }

    public override void Release()
    {
        base.Release();
    }

    public override void Update()
    {
        base.Update();
        if (Input.GetKeyDown(KeyCode.P))
        {
            foreach(var dic in m_attributeAll.m_dicValue)
            {
                Debug.Log("类型：" + dic.Key.ToString() + " 值：" + dic.Value.Value);
            }
        }
    }

    public AttrValue GetAttr(EActorAttr eActorAttr)
    {
        AttrValue attrValue;
        bool result = m_attributeAll.m_dicValue.TryGetValue(eActorAttr, out attrValue);
        return attrValue;
    }

    public void ReCalculate()
    {
        m_attributeAll.Calculate();
    }
}
