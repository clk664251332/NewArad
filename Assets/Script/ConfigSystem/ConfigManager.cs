﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using UnityEditor;
using Game.Config;

/// <summary>
/// 配置系统管理器
/// </summary>
public class ConfigManager: SingletonObject<ConfigManager>
{
    private string strObjectPath = "Assets/Resources/ScriptableObject/";
    private Dictionary<string, Type> m_dic = new Dictionary<string, Type>();
    public Dictionary<Type, ScriptableObjectBase> m_dictObjs = new Dictionary<Type, ScriptableObjectBase>();

    public  void Release()
    {
        m_dic.Clear();
        m_dictObjs.Clear();
    }

    public void Initialize()
    {
        InitLoaderInfo();
        LoadFile(strObjectPath);
        //测试配置系统
        var data = GetData<GuitextLoader, GuitextLoader.Data>(9100001);
        Debug.Log(data.Text);
    }

    private void InitLoaderInfo()
    {
        m_dic.Add("GuitextLoader.asset", typeof(GuitextLoader));
        m_dic.Add("AudioLoader.asset", typeof(AudioLoader));
        m_dic.Add("FashionLoader.asset", typeof(FashionLoader));
        m_dic.Add("PartLoader.asset", typeof(PartLoader));
        m_dic.Add("PlayerLoader.asset", typeof(PlayerLoader));
    }
    private void LoadFile(string strPath)
    {
        if (Directory.Exists(strPath))
        {
            foreach (var v in m_dic)
            {
                var temp = AssetDatabase.LoadAssetAtPath(strPath + v.Key, v.Value);
                ScriptableObjectBase tempObject = temp as ScriptableObjectBase;
                m_dictObjs.Add(v.Value, tempObject);
                tempObject.FillDic();
            }

        }
    }
    
    public T2 GetData<T1, T2>(uint uIndex) where T1 : ScriptableObjectBase where T2 : ObjectBase
    {
        Type objType = typeof(T1);
        ScriptableObjectBase obj = null;
        if(m_dictObjs.TryGetValue(objType, out obj))
        {
            if (obj != null)
            {
                T2 data = obj.GetData<T2>(uIndex);
                return data;
            }
        }
        return default(T2);
    }

    public T GetLoader<T>() where T : ScriptableObjectBase
    {
        ScriptableObjectBase objValue;
        if (m_dictObjs.TryGetValue(typeof(T), out objValue))
        {
            return objValue as T;
        }
        else
        {
            Debug.Log("未找到对应Loader");
            return null;
        }
    }

    public void Update()
    {

    }
}
