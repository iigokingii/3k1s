using System;
using System.Collections.Generic;

namespace Aircompany.Planes
{
    public abstract class Plane
    {
        private string _model;
        private int _maxSpeed;
        private int _maxFlightDistance;
        private int _maxLoadCapacity;

        public Plane(string model, int maxSpeed, int maxFlightDistance, int maxLoadCapacity)
        {
            _model = model;
            _maxSpeed = maxSpeed;
            _maxFlightDistance = maxFlightDistance;
            _maxLoadCapacity = maxLoadCapacity;
        }

        public string GetModel()
        {
            return _model;
        }

        public int GetMS()
        {
            return _maxSpeed;
        }

        public int MAXFlightDistance()
        {
            return _maxFlightDistance;
        }

        public int MAXLoadCapacity()
        {
            return _maxLoadCapacity;
        }

        public override string ToString()
        {
            return $"Plane{{ model='{_model}', maxSpeed={_maxSpeed}, maxFlightDistance={_maxFlightDistance}, maxLoadCapacity={_maxLoadCapacity} }}";
        }

        public override bool Equals(object obj)
        {
            var plane = obj as Plane;
            return plane != null &&
                   _model == plane._model &&
                   _maxSpeed == plane._maxSpeed &&
                   _maxFlightDistance == plane._maxFlightDistance &&
                   _maxLoadCapacity == plane._maxLoadCapacity;
        }

        public override int GetHashCode()
        {
            return HashCode.Combine(_model, _maxSpeed, _maxFlightDistance, _maxLoadCapacity);
        }        

    }
}
