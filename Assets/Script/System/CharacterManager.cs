using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CharacterManager : SingletonObject<CharacterManager>
{
    protected List<Actor> m_lstCharacterList = new List<Actor>();

    public  void Initialize()
    {
        //角色的添加暂时先在这里
        if (string.IsNullOrEmpty(SingletonObject<Hero>.Instance.Name))
            CreateActor<Hero>("鬼剑士");
       // CreateActor<Monster>("哥布林");
    }

    public Actor CreateActor<T>(string name) where T : Actor, new()
    {
        Actor actor;

        Type t = typeof(T);
        if (t.Name.Equals("Hero"))
            actor = SingletonObject<Hero>.Instance as Actor;
        else
            actor = new T();

        actor.Name = name;
        m_lstCharacterList.Add(actor);
        //角色创建出来立刻进行初始化
        actor.Initialize();
        return actor;
    }

    public  void Update()
    {
        for (int i = 0; i < m_lstCharacterList.Count; i++)
        {
            m_lstCharacterList[i].Update();
        }
    }

    public void FixedUpdate()
    {
        for (int i = 0; i < m_lstCharacterList.Count; i++)
        {
            m_lstCharacterList[i].FixedUpdate();
        }
    }

    public void Release()
    {
        for (int i = 0; i < m_lstCharacterList.Count; i++)
        {
            m_lstCharacterList[i].Release();
        }

        m_lstCharacterList.Clear();
    }
}
