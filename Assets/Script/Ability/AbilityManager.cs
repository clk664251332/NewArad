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

    public T AddAbility<T>(Actor actor) where T : BaseAbility, new()
    {
        BaseAbility abilitty = new T();
        abilitty.SetOwner(actor);
        m_listAbilityList.Add(abilitty);
        return abilitty as T;
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

    public void Initialize()
    {
        for (int i = 0; i < m_listAbilityList.Count; i++)
        {
            m_listAbilityList[i].Initialize();
        }
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
