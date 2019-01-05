using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AttributeNode
{
    private AttributeNode m_Parent;
    private List<AttributeNode> m_childNodeList = new List<AttributeNode>();
    protected AttrAbility m_attrAbility;

    public Dictionary<EActorAttr, AttrValue> m_dicValue = new Dictionary<EActorAttr, AttrValue>();
    //private List<AttrValue> m_lstValues = new List<AttrValue>();
    //public AttrData m_attrData;
    public AttributeNode(AttrAbility attrAbility)
    {
        m_attrAbility = attrAbility;
        //m_attrData = new AttrData(attrAbility);
        for(int i = 0; i < (int)EActorAttr.AttrEnd; i++)
        {
            AttrValue attrValue = new AttrValue((EActorAttr)i, attrAbility);
            m_dicValue.Add((EActorAttr)i, attrValue);
        }
    }

    public virtual void Initialize()
    {

    }

    public void Calculate()
    {
        //最顶层和中间层归零
        if (GetParent() == null)// || GetChildNodeCount() <= 0)
        {
            //ResetValue();
        }

        foreach (AttributeNode childNode in m_childNodeList)
        {
            if (childNode.GetChildNodeCount() > 0)
            {
                childNode.Calculate();
            }

            foreach (var dicElement in m_dicValue)
            {
                AttrValue outValue;
                if (childNode.m_dicValue.TryGetValue(dicElement.Key, out outValue))
                {
                    dicElement.Value.PlusValue(outValue.Value);
                }
            }
        }
    }

    public void SetAttrValue(EActorAttr eActorAttr, float value)
    {
        AttrValue attrValue;
        bool result = m_dicValue.TryGetValue(eActorAttr, out attrValue);
        if (result)
        {
            attrValue.SetValue(value);
        }
    }

    public void ResetValue()
    {
        foreach (var dicElement in m_dicValue)
        {
            dicElement.Value.SetValue(0);
        }
    }

    public void SetParent(AttributeNode parent)
    {
        m_Parent = parent;
    }

    public AttributeNode GetParent()
    {
        return m_Parent;
    }

    public int GetChildNodeCount()
    {
        return m_childNodeList.Count;
    }

    public void AddChildNode(AttributeNode childNode)
    {
        childNode.SetParent(this);
        m_childNodeList.Add(childNode);
    }
    public void RemoveChildNode(AttributeNode childNode)
    {
        m_childNodeList.Remove(childNode);
    }
}
