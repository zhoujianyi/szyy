using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace datacut.Model
{
    public class Grade
    {
        private string _id;
        private string _fish;
        private string _jan;
        private string _feb;
        private string _mar;
        private string _apr;
        private string _may;
        private string _jun;
        private string _jul;
        private string _aug;
        private string _sep;
        private string _oct;
        private string _nov;
        private string _dec;

        private string selecthtml = "<img src = '' style = 'width:40px;height:40px;margin:10px;cursor:pointer;'  onclick = 'gradeBox.create(\"{0}-{1}\");' />";

        public string Id
        {
            get { return _id; }
            set
            {
                _id = value;
            }
        }

        public string Fish
        {
            get { return _fish; }
            set { 
                _fish = value; }
        }

        public string Jan
        {
            get { return _jan; }
            set
            {
                if (value == "")
                    _jan = string.Format(selecthtml , Id , "jan");
                else
                    _jan = value;
            }
        }

        public string Feb
        {
            get { return _feb; }
            set
            {
                if (value == "")
                    _feb = string.Format(selecthtml , Id , "feb");
                else
                    _feb = value;
            }
        }

        public string Mar
        {
            get { return _mar; }
            set
            {
                if (value == "")
                    _mar = string.Format(selecthtml , Id , "mar");
                else
                    _mar = value;
            }
        }

        public string Apr
        {
            get { return _apr; }
            set
            {
                if (value == "")
                    _apr = string.Format(selecthtml , Id , "apr");
                else
                    _apr = value;
            }
        }

        public string May
        {
            get { return _may; }
            set
            {
                if (value == "")
                    _may = string.Format(selecthtml , Id , "may");
                else
                    _may = value;
            }
        }

        public string Jun
        {
            get { return _jun; }
            set
            {
                if (value == "")
                    _jun = string.Format(selecthtml , Id , "jun");
                else
                    _jun = value;
            }
        }

        public string Jul
        {
            get { return _jul; }
            set
            {
                if (value == "")
                    _jul = string.Format(selecthtml , Id , "jul");
                else
                    _jul = value;
            }
        }

        public string Aug
        {
            get { return _aug; }
            set
            {
                if (value == "")
                    _aug = string.Format(selecthtml , Id , "aug");
                else
                    _aug = value;
            }
        }

        public string Sep
        {
            get { return _sep; }
            set
            {
                if (value == "")
                    _sep = string.Format(selecthtml , Id , "sep");
                else
                    _sep = value;
            }
        }

        public string Oct
        {
            get { return _oct; }
            set
            {
                if (value == "")
                    _oct = string.Format(selecthtml , Id , "oct");
                else
                    _oct = value;
            }
        }

        public string Nov
        {
            get { return _nov; }
            set
            {
                if (value == "")
                    _nov = string.Format(selecthtml , Id , "nov");
                else
                    _nov = value;
            }
        }

        public string Dec
        {
            get { return _dec; }
            set
            {
                if (value == "")
                    _dec = string.Format(selecthtml , Id , "dec");
                else
                    _dec = value;
            }
        }
    }
}