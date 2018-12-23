using System.Collections;
using System.Collections.Generic;
using UnityEngine;
/// <summary>
/// 初始化各系统
/// </summary>
public class App : MonoSingleton<App>
{
    private List<BaseSystem> m_listSystem = null;

    public void Start()
    {
        Initialize();
    }

    public void Initialize()
    {
        m_listSystem = new List<BaseSystem>();
        //创建各个系统
        var characterFactory = CreateAddSystem<CharacterFactory>();   
        //最后进行初始化
        for (int i = 0; i < m_listSystem.Count; i++)
        {
            m_listSystem[i].Initialize();
        }
        //一定要在初始化之后再调用
        characterFactory.CreateActor<Hero>();
    }

    public void Update()
    {
        for (int i = 0; i < m_listSystem.Count; i++)
        {
            m_listSystem[i].Update();
        }
    }

    public T CreateAddSystem<T>() where T : BaseSystem, new()
    {
        BaseSystem system = new T();
        AddSystem(system);
        return system as T;
    }

    public void AddSystem(BaseSystem system)
    {
        if (!m_listSystem.Contains(system))
            m_listSystem.Add(system);
    }

    public T GetSystem<T>() where T : BaseSystem
    {
        foreach (var system in m_listSystem)
        {
            if (system is T)
                return system as T;
        }

        return null;
    }

    public void Release()
    {
        foreach (var system in m_listSystem)
        {
            system.Release();
        }

        m_listSystem.Clear();
    }
}
