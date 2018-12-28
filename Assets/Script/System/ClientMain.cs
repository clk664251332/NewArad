using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Game.Config;
/// <summary>
/// 初始化各系统
/// </summary>
public class ClientMain : SingletonBehaviour<ClientMain>
{
    public void Start()
    {
        Initialize();
    }

    public void Initialize()
    {
        //创建各个系统
        ConfigManager.Instance.Initialize();
        CharacterManager.Instance.Initialize();
    }

    public void Update()
    {
        ConfigManager.Instance.Update();
        CharacterManager.Instance.Update();
    }

    public void FixedUpdate()
    {
        CharacterManager.Instance.FixedUpdate();
    }

    public void Release()
    {
        ConfigManager.Instance.Release();
        CharacterManager.Instance.Release();
    }

    public void OnGUI()
    {
        EActionState state = SingletonObject<Hero>.Instance.GetStateMgr().GetCurrActionState();
        GUI.Label(new Rect(30, 10, 100, 200), state.ToString());
        
    }
}
