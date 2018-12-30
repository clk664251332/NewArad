using UnityEngine;
using System;
using System.Collections.Generic;

namespace Game.Config
{
    [Serializable]
    [ConfigName("c_fashion")]
    public partial class FashionLoader : ScriptableObjectBase
    {
        [Serializable]
        public partial class Data : ObjectBase
        {
            public uint Id; // ID
            public string Remark; // 备注
            public uint Skin; // 皮肤ID
            public uint Hair; // 头发ID
            public uint Cap; // 帽子ID
            public uint Chest; // 项链ID
            public uint Coat_1; // 上衣_1ID
            public uint Coat_2; // 上衣_2ID
            public uint Belt; // 腰带ID
            public uint Pants_1; // 下装_1ID
            public uint Pants_2; // 下装_2ID
            public uint Shoes_1; // 鞋_1ID
            public uint Shoes_2; // 鞋_2ID
            public uint Weapon_1; // 武器_1ID
            public uint Weapon_2; // 武器_2ID
            public uint Weapon_3; // 武器_3ID
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
