void main(List<String> arguments) {
  LinskedList linskedList = LinskedList();

  linskedList.add(10);
  linskedList.add(20);
  linskedList.add(30);
  linskedList.add(40);
  linskedList.add(50);

  linskedList.Print();

  print('--------------------------------------------');

  Node? node = linskedList.find(10);
  if (node != null) {
    linskedList.insertAfter(node, 5);
  }
  linskedList.Print();
}

class Node<T> {
  Node(this.data);
  //assign the value of the node
  T data;
  Node<T>? next;
}

class LinskedList<T> {
  //creating the head of the linkedList
  Node<T>? head;

  LinskedList();

  bool get isEmpty => head == null;

  void add(T value) {
    final newNode = Node<T>(value);

    if (isEmpty) {
      head = newNode;
      return;
    } else {
      var current = head;
      while (current!.next != null) {
        current = current.next;
      }
      current.next = newNode;
    }
  }

  void removeAtBegginning() {
    if (isEmpty) {
      return;
    }

    if (head!.next == null) {
      head = null;
      return;
    } else {
      head = head!.next;
    }
  }

  void removeAtEnd() {
    if (isEmpty) {
      return;
    }

    if (head!.next == null) {
      head = null;
      return;
    } else {
      var current = head;
      while (current!.next!.next != null) {
        current = current.next;
      }
      current.next = null;
      return;
    }
  }

  Node<T>? find(T value) {
    if (isEmpty) {
      return null;
    }

    if (head!.data == value) {
      return head;
    } else {
      var current = head;

      while (current != null) {
        if (current.data == value) {
          return current;
        }
        current = current.next;
      }
      return null;
    }
  }

  void insertAfter(Node<T> node, T value) {
    Node<T> newNode = Node(value);

    if (isEmpty) {
      head = newNode;
    }
    if (node == head) {
      newNode.next = head!.next;
      head!.next = newNode;

      return;
    } else {
      var current = head;
      while (current != null) {
        if (node == current) {
          newNode.next = current.next;
          current.next = newNode;
          return;
        }
        current = current.next;
      }
    }
  }

  void insertBefore(Node<T> node, T value) {
    //TODO: IMPLEMENT LATER
  }
  void Print() {
    var current = head;

    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }
}
