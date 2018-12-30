﻿using UnityEngine;
using System;
using System.Collections.Generic;

namespace Game.Config
{
    [Serializable]
    [ConfigName("c_player")]
    public partial class PlayerLoader : ScriptableObjectBase
    {
        [Serializable]
        public partial class Data : ObjectBase
        {
            public uint Id; // ID
            public string Name; // 名称
            public uint DefaultFashionId; // 默认时装配置
            public string AnimatorName; // 动画Prefab名字
        }

        public List<Data> datas = new List<Data>();

        private Dictionary<uint, Data> m_dicData = new Dictionary<uint, Data>();

        public override void FillDic()
        {
            base.FillDic();

            m_dicData.Clear();
            for (int i = 0, count = datas.Count; i < count; i++)
            {
                CommonHelper.FillDic<uint, Data>(datas[i].Id, datas[i], m_dicData);
            }
        }

        public override void ParseData()
        {
            base.ParseData();

            for (int i = 0, count = datas.Count; i < count; i++)
            {
                datas[i].ParseData();
            }
        }

        public override T GetData<T>(uint key)
        {
            Data data = null;
            if (m_dicData.TryGetValue(key, out data))
            {
                return data as T;
            }
            return default(T);
        }
    }
}
