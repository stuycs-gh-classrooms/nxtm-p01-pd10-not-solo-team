class BulletList {
  Bullet[] arr;
  int size;

  BulletList() {
    arr = new Bullet[20];
    size = 0;
  }

  void expand() {
    Bullet[] n = new Bullet[arr.length * 2];
    for (int i = 0; i < size; i++) {
      n[i] = arr[i];
    }
    arr = n;
  }

  void add(Bullet b) {
    if (size == arr.length) {
      expand();
    }
    arr[size++] = b;
  }

  void add(int i, Bullet b) {
    if (i < 0 || i > size) {
      return;
    }
    if (size == arr.length) {
      expand();
    }
    for (int n = size; n > i; n--) {
      arr[n] = arr[n - 1];
    }
    arr[i] = b;
    size++;
  }

  Bullet get(int i) {
    if (i < 0 || i >= size) {
      return null;
    }
    return arr[i];
  }

  Bullet remove(int i) {
    if (i < 0 || i >= size) {
      return null;
    }
    Bullet v = arr[i];
    for (int n = i; n < size - 1; n++) {
      arr[n] = arr[n + 1];
    }
    size--;
    return v;
  }

  int size() {
    return size;
  }
}
