using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AbilityManager
{
    public List<BaseAbility> m_listAbilityList = null;

    public AbilityManager()
    {
        m_listAbilityList = new List<BaseAbility>();
    }

    public void AddAbility(BaseAbility baseAbility)
    {
        if (!m_listAbilityList.Contains(baseAbility))
            m_listAbilityList.Add(baseAbility);
    }

    public T GetAbility<T>() where T : BaseAbility
    {
        foreach (var ability in m_listAbilityList)
        {
            if (ability is T)
                return ability as T;
        }

        return null;
    }

    public void Update()
    {
        for (int i = 0; i < m_listAbilityList.Count; i++)
        {
            m_listAbilityList[i].Update();
        }
    }

    public void Release()
    {
        for (int i = 0; i < m_listAbilityList.Count; i++)
        {
            m_listAbilityList[i].Release();
        }

        m_listAbilityList.Clear();
    }
}
